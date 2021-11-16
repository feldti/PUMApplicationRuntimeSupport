*MSK-ModelBaseRuntime
pumStartsWith: aString

	aString isNil ifTrue:[ ^false ].
	^self startsWith: aString
