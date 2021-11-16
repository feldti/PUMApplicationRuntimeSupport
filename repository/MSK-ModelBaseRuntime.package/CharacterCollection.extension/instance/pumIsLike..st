*MSK-ModelBaseRuntime
pumIsLike: anotherObject

	anotherObject isNil ifTrue:[ ^false ].
	^(self  findString: anotherObject startingAt: 1) > 0
