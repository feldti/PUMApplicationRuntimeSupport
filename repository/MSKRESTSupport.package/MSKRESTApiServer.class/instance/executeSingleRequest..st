other
executeSingleRequest: stream
  "Execute one single HTTP request / response cycle on stream in 3 steps:
	#readRequest: #handleRequest: and #writeResponse:on:
	Indicate that we intend to close the connection afterwards"

  | request response |
  ZnCurrentServer
    value: self
    during: [ 
		| read handle resp start stop total alertLevel |

		read := handle := resp := 0.
		start := DateAndTime now.

		request := 
			[
				[
					self readRequest: stream.
				]
				on: ZnEntityTooLarge 
				do: [ :ex |
					response := ZnResponse serverError:  ex printString.
					ex return
				]
			]
			on: Exception
			do: [ :exception |  | stackReport |
				"GRPlatform current saveExceptionContinuationInOwnTransaction: exception."
				MSKRestCallServerZMQ mskerror: '#exception#'.
				stackReport := (exception printString),(String crlf),(GsProcess stackReportToLevel: 100).	
				GsFile gciLogServer: stackReport.
				response := ZnResponse serverError:  stackReport.
				exception return
			].

		stop := DateAndTime now.
		read := (stop - start) asMilliSeconds.

		"Eine Bearbeitung sollte nur stattfinden, wenn noch kein Response vorliegt"
		response isNil ifTrue:[
			start := DateAndTime now.
			response := 
				[
					self handleRequest: request
				]
				on: Exception
				do: [ :exception |  | stackReport |
					"GRPlatform current saveExceptionContinuationInOwnTransaction: exception."
					MSKRestCallServerZMQ mskerror: '#exception#'.
					stackReport := (exception printString),(String crlf),(GsProcess stackReportToLevel: 100).		
					GsFile gciLogServer: stackReport.
					exception return: (ZnResponse serverError:  stackReport)
				].
			stop := DateAndTime now.
			handle := (stop - start) asMilliSeconds.
		].

		response notNil ifTrue:[
			start := DateAndTime now.
			[
				response setConnectionClose.
				self writeResponse: response on: stream
			]
			on: Error
			do: [ :exception |   | stackReport |
				"GRPlatform current saveExceptionContinuationInOwnTransaction: exception."
				MSKRestCallServerZMQ mskerror: '#exception#'.
				stackReport := (exception printString),(String crlf),(GsProcess stackReportToLevel: 100).		
				GsFile gciLogServer: stackReport.
				exception return
			].
			stop := DateAndTime now.
			resp := (stop - start) asMilliSeconds.
		].

		alertLevel := '#L0#'.
		total := read + handle + resp.
		total  > 100
			ifTrue:[ alertLevel := '#L1#' ].
		total > 1000
			ifTrue:[ alertLevel := '#L2#' ].
		total > 10000
			ifTrue:[ alertLevel := '#L3#' ].

		request isNil 
			ifTrue:[
				MSKRestCallServerZMQ msklog: 'Duration ' ,alertLevel,': ',read truncated asString,' (read)/ ',handle truncated asString,' (handle)/ ',resp truncated asString,' (response)/ ',total truncated asString,' (total) ms -- '.
			]
			ifFalse:[
				MSKRestCallServerZMQ msklog: 'Duration ' ,alertLevel,': ',read truncated asString,' (read)/ ',handle truncated asString,' (handle)/ ',resp truncated asString,' (response)/ ',total truncated asString,' (total) ms -- ', request url asString. 			
			]
	]