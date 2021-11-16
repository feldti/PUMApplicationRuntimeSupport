api definitions cache
addAPIDeclaration: aMSKSwaggerAPIDeclaration

	APIDefinitions add: aMSKSwaggerAPIDeclaration.
	self addOperationNamesOf: aMSKSwaggerAPIDeclaration to: MessageDefinitions