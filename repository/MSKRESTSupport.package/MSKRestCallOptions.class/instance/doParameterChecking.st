checking
doParameterChecking
		"Method comment"

	self operation parameters do: [ :eachMSKSwaggerParameterDescription | | answer searchInForm |

		"Zuerst wird ein Parameter in der Form geprüft"
		((searchInForm := (eachMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterFormLocated)) 
							and: [ self formUrlEncodedEntity isNil ]) ifTrue:[	self formUrlEncodedEntity: self restCallInstance checkFormData ].
		searchInForm
			ifTrue:[ 	
				self formUrlEncodedEntity isNil ifTrue:[ 
					^MSKRESTAPIAnswer 
						badRequestFor: self restCallInstance 
						object: (self restCallInstance error:  MSKRESTBaseErrorCodes errCodeNoParameterOrNoFormElements) 
				].		
				(answer := (self parameterCheckerFor: eachMSKSwaggerParameterDescription) doFormChecking) notNil ifTrue:[ ^answer ]		
			]
			ifFalse:[
				(eachMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterPathLocated)
					ifTrue:[
						(answer := (self parameterCheckerFor: eachMSKSwaggerParameterDescription) doPathChecking) notNil ifTrue:[ ^answer ]	
					]
					ifFalse:[
						(eachMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterQueryLocated)	
							ifTrue:[
								(answer := (self parameterCheckerFor: eachMSKSwaggerParameterDescription) doQueryChecking) notNil ifTrue:[ ^answer ]	
							]
							ifFalse:[
								(eachMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterBodyLocated)	
									ifTrue:[
										(answer := (self parameterCheckerFor: eachMSKSwaggerParameterDescription) doBodyChecking) notNil ifTrue:[ ^answer ]	
									]
									ifFalse:[
									]
							]
					]
			].

		
	].

	^nil