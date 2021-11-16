*MSK-ModelBaseRuntime
pumUpperlimitValue
	| lastCharacter newLastCharacter |

	self isEmpty ifTrue:[ ^self ].

	lastCharacter := self last.

	newLastCharacter :=
		lastCharacter = $9
			ifTrue:[ $A ]
			ifFalse:[
				(lastCharacter = $z or:[ lastCharacter = $Z ])
					ifTrue:[ lastCharacter asString,'zzzzzzzzzzzzzzzzzzzzzzzz'  ]
					ifFalse:[ Character withValue: (self last codePoint + 1) ]
			].


	^(self copyFrom: 1 to: self size - 1),newLastCharacter
