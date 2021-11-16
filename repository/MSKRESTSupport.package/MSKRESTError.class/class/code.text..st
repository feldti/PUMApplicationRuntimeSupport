instance creation
code: codeInteger text: aString
	"^<MSKRESTError or subclass>"

	^self new initialize
		code: codeInteger ;
		text: aString ;
		yourself