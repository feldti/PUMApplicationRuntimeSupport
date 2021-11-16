parameter handling
collectAndCheckParameters: aMSKSwaggerOperation

	| parametersFound  body searchInForm searchInBody searchInVariables aMSKRestCallOptions anAnswer |

	aMSKRestCallOptions := MSKRestCallOptions new.

	aMSKSwaggerOperation parameters do: [ :eachMSKSwaggerParameterDescription |
		
		"Zuerst wird ein Parameter in der Form geprüft"
		((searchInForm := (eachMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterFormLocated)) 
							and: [ aMSKRestCallOptions formUrlEncodedEntity isNil ]) ifTrue:[	aMSKRestCallOptions formUrlEncodedEntity: self checkFormData ].
		searchInForm
			ifTrue:[ 	| checker |
				"Keine Form -> Fehler mit Abbruch !"
				aMSKRestCallOptions formUrlEncodedEntity isNil ifTrue:[ ^self halt ].
				checker := aMSKRestCallOptions parameterCheckerFor: eachMSKSwaggerParameterDescription.
				(anAnswer := checker doChecking) notNil ifTrue:[ ^anAnswer ].

				"Nun wird der Parameter geprüft"
				(eachMSKSwaggerParameterDescription missingBlock notNil)
					ifTrue:[
						checker ifMissing: eachMSKSwaggerParameterDescription missingBlock.
					].
				(eachMSKSwaggerParameterDescription validBlock notNil)
					ifTrue:[
						checker ifValid: eachMSKSwaggerParameterDescription validBlock.
					].
				(eachMSKSwaggerParameterDescription notValidBlock notNil)
					ifTrue:[
						checker ifNotValid: eachMSKSwaggerParameterDescription notValidBlock.
					].
				(eachMSKSwaggerParameterDescription definedBlock notNil)
					ifTrue:[
						checker ifDefined: eachMSKSwaggerParameterDescription definedBlock.
					].
			].

	].

	^aMSKRestCallOptions