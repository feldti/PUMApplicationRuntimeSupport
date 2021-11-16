*MSK-ModelBaseRuntime
pumIsSmallerOrEqualTo: anotherObject
	"<="

	anotherObject isNil ifTrue:[ ^true ].
	^self <= anotherObject
