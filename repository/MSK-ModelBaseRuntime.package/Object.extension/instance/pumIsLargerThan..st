*MSK-ModelBaseRuntime
pumIsLargerThan: anotherObject

	anotherObject isNil ifTrue:[ ^true ].
	^self > anotherObject
