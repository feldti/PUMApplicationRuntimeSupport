execution
_primitiveHandler
	"^<GessCatiAPIAnswer >"

			^[
					[ 
						[
							[
								[
									| operation |
									(operation := self swaggerOperation) isNil
										ifTrue:[
											| restError |
											restError := MSKRESTError code: -1 text: ('Operation unknown: ' ,(variables at: 'MessageNickName') asString).
											(MSKRESTAPIAnswer okRequestFor: self  object: restError) 
													failureWithNoCommitCall ;
													noRetriesAllowed ;
													yourself 
										]
										ifFalse:[
											self executeSwaggerOperation: operation
										]										
								]
								on: NeoJSONParseError 
								do: [ :ex |
											| restError |
											restError := MSKRESTError code: -1 text: ('JSON parsing Error: ', ex messageText).
											ex return: ((MSKRESTAPIAnswer okRequestFor: self  object: restError) 
																failureWithNoCommitCall ;
																noRetriesAllowed ;
																yourself )
								]
							]
							on: PUMTypeError
							do: [ :ex |
										| restError |
										restError := MSKRESTError code: -1 text: ('Type Error ',ex className asString,'>>',ex attributeName,' Expected: ',ex expectedType asString,' Got: ',ex receivedType).
										ex return: ((MSKRESTAPIAnswer okRequestFor: self  object: restError) 
															failureWithNoCommitCall ;
															noRetriesAllowed ;
															yourself )
							]
						]
						on: MSKRESTSessionNotFound 
						do: [ :ex | 
							ex return: ((MSKRESTAPIAnswer 
												okRequestFor: self 
												object: (self error: MSKRESTBaseErrorCodes errCodeWrongUserSession arguments: (Array with: 'Expired?')))
												noRetriesAllowed ;
												failureWithNoCommitCall ;
												yourself )  
						]
					]
					on: MSKRESTSessionInfoNotFound 
					do: [ :ex | 
						ex return: ((MSKRESTAPIAnswer 
											okRequestFor: self 
											object: (self error: MSKRESTBaseErrorCodes errCodeWrongActingUserSession))
												noRetriesAllowed ;
												failureWithNoCommitCall ;
												yourself  )  
				]
			]
			on: MSKRESTCallApplicationError
			do:[ :ex |	ex return: ex mskRESTAPIAnswer	].