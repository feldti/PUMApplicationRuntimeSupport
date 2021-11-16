*MSK-ModelBaseRuntime
pumIsNotIn: anotherObject

	anotherObject isNil ifTrue:[ ^false ].
	^(anotherObject includes: self) not
