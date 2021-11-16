execution
_primitiveHandler
	"^<GessCatiAPIAnswer >"

			^[
					[ 
						[
							[
								[
										self perform: self method 
								]
								on: NeoJSONParseError 
								do: [ :ex |
									ex return: (((MSKRESTAPIAnswer okRequestFor: self  object: ('JSON parsing Error: ', ex messageText)))
														failureWithNoCommitCall ;
														noRetriesAllowed ;
														yourself ) 

								]
							]
							on: PUMTypeError
							do: [ :ex |
								ex return: (((MSKRESTAPIAnswer 
													okRequestFor: self  
													object: ('Type Error ',ex className asString,'>>',ex attributeName,' Expected: ',ex expectedType asString,' Got: ',ex receivedType))) 
													failureWithNoCommitCall ;
													noRetriesAllowed ;
													yourself )
							]
						]
						on: MSKRESTSessionNotFound 
						do: [ :ex | 
							ex return: ((MSKRESTAPIAnswer 
												okRequestFor: self 
												object: (self error: MSKRESTBaseErrorCodes errCodeWrongActingUserSession ))
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