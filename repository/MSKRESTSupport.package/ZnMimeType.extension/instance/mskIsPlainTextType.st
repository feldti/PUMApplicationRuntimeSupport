*MSKRESTSupport
mskIsPlainTextType

	| subTypes |

	self main asLowercase ~= 'text' ifTrue:[ ^false ].

	subTypes := self sub subStrings: '+'.
	^(subTypes detect: [ :each | #('plain') includes: each ] ifNone: [ nil ]) notNil