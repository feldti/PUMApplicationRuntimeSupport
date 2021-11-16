*MSK-ModelBaseRuntime
mskCheckNotNilDefinitionState

	^self ~= UndefinedObject and:[ self isNil not ]
