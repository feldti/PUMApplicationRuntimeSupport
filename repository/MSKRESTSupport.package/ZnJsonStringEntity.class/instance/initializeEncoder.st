other
initializeEncoder
	| charSet  |

	self hasEncoder ifTrue: [ ^ self ].

	(charSet := contentType charSet) isNil 
		ifTrue:[ contentType setCharSetUTF8. charSet := contentType charSet ].

	self encoder: ZnUTF8Encoder new 
								beLenient;
								yourself.