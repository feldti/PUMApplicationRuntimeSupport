*MSKRESTSupport
mskIsJSONType

	| subTypes |

	self main asLowercase ~= 'application' ifTrue:[ ^false ].

	subTypes := self sub subStrings: '+'.
	^(subTypes detect: [ :each | #('json') includes: each ] ifNone: [ nil ]) notNil