Accessing
dbgloc

	(addDebugInfo not or:[ restCall isNil ]) ifTrue:[ ^nil ].
	^restCall apiMethodSignature