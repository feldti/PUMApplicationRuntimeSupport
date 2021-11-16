api definitions cache
buildAPIDefinitionsStructure

	self clearAPIDefinitions.
	self clearMessageDefinitions.
	self addAllAPIDefinitions.
	^APIDefinitions