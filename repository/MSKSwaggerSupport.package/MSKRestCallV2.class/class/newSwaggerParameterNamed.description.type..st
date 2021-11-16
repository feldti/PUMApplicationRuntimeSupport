subclass - responsibility
newSwaggerParameterNamed: nameString description: descriptionString type: jsonType

	^MSKSwaggerParameterDescription new initialize
			name: nameString ; 
			description: descriptionString ;
			type: jsonType ;
			missingBlock: self defaultParameterMissingBlock ;
			definedBlock: self defaultParameterDefinedBlock ;
			notValidBlock: self defaultParameterNotValidBlock ;
			yourself