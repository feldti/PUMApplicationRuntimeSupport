checking-private
parameterCheckerFor: aMSKSwaggerParameterDescription
		"Method comment"

	^MSKFormParameterChecker new initialize
		option: self ;
		swaggerParameter: aMSKSwaggerParameterDescription ;
		yourself