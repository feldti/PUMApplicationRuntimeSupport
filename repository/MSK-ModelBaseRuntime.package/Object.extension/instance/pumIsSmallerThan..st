*MSK-ModelBaseRuntime
pumIsSmallerThan: anotherObject

	anotherObject isNil ifTrue:[ ^true ].
	^self < anotherObject
