Accessing
dbgapi

	(addDebugInfo not or:[ restCall isNil ]) ifTrue:[ ^nil ].
	^restCall apiSignature