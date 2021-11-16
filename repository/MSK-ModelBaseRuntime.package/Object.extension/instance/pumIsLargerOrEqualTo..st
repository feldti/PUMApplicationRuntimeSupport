*MSK-ModelBaseRuntime
pumIsLargerOrEqualTo: anotherObject

	anotherObject isNil ifTrue:[ ^true ].
	^self >= anotherObject
