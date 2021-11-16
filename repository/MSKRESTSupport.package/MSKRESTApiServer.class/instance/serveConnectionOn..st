other
serveConnectionOn: listeningSocket
  "We wait up to acceptWaitTimeout seconds for an incoming connection.
	If we get one we wrap it in a SocketStream and #executeOneRequestResponseOn: on it.
	We do not fork a worker thread/process but stay in the current one for just one request/response cycle."

	[ 
		| stream socket |
		socket := self waitForConnectionFor: self acceptWaitTimeout on: listeningSocket ifTimedOut: [ nil ].
		socket ifNil: [ 
			^ self noteAcceptWaitTimedOut ].
		stream := self socketStreamOn: socket.
		[ 
			[ 
				[ self executeSingleRequest: stream ]
				on: self log gemServerExceptionSet
				do: [ :ex | self log handleBreakpointException: ex resumeIfResumable: self debugMode not ] 
			]
			ensure: [ 
				stream close 
			] 
		]
		ifCurtailed: [ 
			self log debug: 'Destroying socket'.
			socket destroy 
		] 
	]
    on: self log gemServerExceptionSet
    do: [ :ex | self log handleBreakpointException: ex resumeIfResumable: self debugMode not ]