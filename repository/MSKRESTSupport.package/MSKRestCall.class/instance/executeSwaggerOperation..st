execution
executeSwaggerOperation: aMSKExtSwaggerOperation
	| aMSKRestCallOptions aMSKRESTAPIAnswer |

	(aMSKExtSwaggerOperation debugModeCallOnly and:[ self class projectClass default getDebugMode not ])
		ifTrue:[
			^MSKRESTAPIAnswer 
				badRequestFor: self 
				object: (self error: MSKRESTBaseErrorCodes errCodeNoDebugMode)].

	"hier passiert nichts - nur das anlegen von objekten"
	aMSKRestCallOptions := MSKRestCallOptions withRESTCall: self operation: aMSKExtSwaggerOperation.
	
	"hier werden alle parameter abgeglichen"
	(aMSKRESTAPIAnswer := aMSKRestCallOptions doParameterChecking) notNil ifTrue:[ ^aMSKRESTAPIAnswer ].

	"session checking erst hier, denn die session info könnte auch per Parameter kommen"
	aMSKExtSwaggerOperation checkSession
		ifTrue:[ self checkSessionCookie: aMSKRestCallOptions ].

	"Hier wird der API-Call durchgeführt"
	^aMSKExtSwaggerOperation serviceCall value: self value: aMSKRestCallOptions.