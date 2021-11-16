Accessing
dbgts

	(addDebugInfo not or:[ restCall isNil ]) ifTrue:[ ^nil ].
	^DateAndTime now asUTC