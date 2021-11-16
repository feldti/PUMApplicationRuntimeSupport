*MSK-ModelBaseRuntime
pumCheckBlocks: aValue

	self isEmpty ifTrue:[ ^false ].

	self do:[ :eachBlockAndValue |
		((eachBlockAndValue at: 1)  value: aValue value: (eachBlockAndValue at: 2) ) ifFalse:[ ^false ]
	].

	^true
