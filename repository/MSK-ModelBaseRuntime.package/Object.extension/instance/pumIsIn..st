*MSK-ModelBaseRuntime
pumIsIn: anotherObject

	anotherObject isNil ifTrue:[ ^false ].
	^anotherObject includes: self
