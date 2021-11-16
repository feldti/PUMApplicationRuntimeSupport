adding
addParameter: aMSKSwaggerParameterDescription

	
	self parameters add: aMSKSwaggerParameterDescription.

	"if we have a form parameter I assume, that we consume a form"
	(aMSKSwaggerParameterDescription paramType = MSKSwaggerConstants parameterFormLocated) ifTrue:[
		self addFormConsumeSpecification
	].