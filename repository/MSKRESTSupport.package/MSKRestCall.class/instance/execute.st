execution
execute
	"^<GessCatiAPIAnswer >"

	"CAUTION - in any case there may be cases, where a session is not available when executing this method"

	| aMSKRESTAPIAnswer maxRetries retryCounter continueRetry projectClass  sessionExistsAndIsExpired |

	maxRetries := 6.
	retryCounter := 0.
	continueRetry := true.
	projectClass := self class projectClass.

	sessionExistsAndIsExpired := self session notNil and: [ self session hasExpired ].

	"Checkup before doing too much work"
	sessionExistsAndIsExpired
		ifTrue:[
			System abortTransaction.
			aMSKRESTAPIAnswer :=
				MSKRESTAPIAnswer 
					okRequestFor: self 
					object: (self error: MSKRESTBaseErrorCodes errCodeWrongUserSession arguments: (Array with: 'Expired?')).
				aMSKRESTAPIAnswer
					noRetriesAllowed ;
					failureWithNoCommitCall;
					finishCall.

			^aMSKRESTAPIAnswer response
		].

	[ continueRetry ] whileTrue:[ 

		"Transaktion beginnen"
		System beginTransaction.
	
		"Here the domain work is done - caution, a new session object could be created"
		(aMSKRESTAPIAnswer := self _primitiveHandler) isMSKRESTAPIAnswer
			ifTrue:[					
					sessionExistsAndIsExpired := self session notNil and: [ self session hasExpired ].
					sessionExistsAndIsExpired
						ifTrue:[
							System abortTransaction.
							aMSKRESTAPIAnswer :=
								MSKRESTAPIAnswer 
									okRequestFor: self 
									object: (self error: MSKRESTBaseErrorCodes errCodeWrongUserSession arguments: (Array with: 'Expired?')).
							aMSKRESTAPIAnswer
								noRetriesAllowed ;
								failureWithNoCommitCall ;
								finishCall. 

							^aMSKRESTAPIAnswer response
						].

					"actionBlocks sollen IMMER ausgefuehrt werden - die dadurch erzeugten Datenstrukturen sollen immer in der DB landen"
					aMSKRESTAPIAnswer actionBlocks do: [ :eachBlock | eachBlock value ].
					aMSKRESTAPIAnswer finishCall.					
					aMSKRESTAPIAnswer doCommit 
						ifTrue:[
							self session notNil ifTrue:[ self session updateTimeout ].
							"No exception wanted while doing commit"
							System _commitPrintingDiagnostics 
								ifTrue:[ 
									"Commit war erfolgreich - nun auch die ZMQ-Telegramme senden"
									aMSKRESTAPIAnswer zmqEvents do: [ :eachZMQTelegram | self delegate sendZMQTelegram: eachZMQTelegram ].	
									MSKRestCallServerZMQ msklog: 'HTTPRequest - Commit wanted and got it. LogEventSize:(',aMSKRESTAPIAnswer logEvents size asString,')'.
									System abortTransaction.
									^aMSKRESTAPIAnswer response 
								]
								ifFalse:[
									aMSKRESTAPIAnswer failureEventCalls do: [ :eachZMQTelegram | self delegate sendZMQTelegram: eachZMQTelegram ].			
									System abortTransaction.							
									self session notNil
										ifTrue:[
											System beginTransaction.
											self session updateTimeout.
											System commitTransaction.
										].
								].
							System abortTransaction.
							retryCounter := retryCounter + 1.

							"Zuviele Retries - Abbrechen mit Conflict-Fall"
							(retryCounter > maxRetries or:[ 	aMSKRESTAPIAnswer retriesAllowed not ])		
								ifTrue:[ 
										"Zwecklos - Abbruch. Prinzipiell ist das kein Fehler - die Clients müssen nur darauf reagieren ..."
										aMSKRESTAPIAnswer := MSKRESTAPIAnswer conflictRequestFor: self object: nil	.	
										MSKRestCallServerZMQ mskerror: 'HTTPRetryRequestOverflow. RetryCount: ', retryCounter asString,' max: ',maxRetries asString. 	
										continueRetry := false.
								]
								ifFalse:[
									"Nicht schlimm - um die Clients zu entlasten versuchen wir es auf der Serverseite mehrfach"
									MSKRestCallServerZMQ mskwarn: 'HTTPRetryRequest. RetryCount: ', retryCounter asString,' max: ',maxRetries asString. 	
								]
						]
						ifFalse:[
							"Wenn eh kein Commit gewünscht ist, dann sollte man trotzdem die Events senden"
							aMSKRESTAPIAnswer zmqEvents do: [ :eachZMQTelegram | self delegate sendZMQTelegram: eachZMQTelegram ].

							System abortTransaction.
							self session notNil
								ifTrue:[
									System beginTransaction.
									self session updateTimeout.
									System commitTransaction.
								].

							"Alles ok: Abort und zurück"
							continueRetry := false.
							MSKRestCallServerZMQ msklog: 'HTTPRequest - no Commit wanted and ok (',aMSKRESTAPIAnswer failureEventCalls size asString,')'
						]
					]
			ifFalse:[
				"Fehlerfall ..."
				aMSKRESTAPIAnswer := MSKRESTAPIAnswer serverErrorRequestFor: self object: nil.
				continueRetry := false.
				MSKRestCallServerZMQ mskerror: 'HTTPFatalError - (not isMSKRESTAPIAnswer). Aborted'.
			]
	].

	System abortTransaction.

	^aMSKRESTAPIAnswer response