instance creation
defaultBlock: aBlock defaultSource: aString sourceType: typeString domainObject: anObject
	"
		(PUMComputedAttribute defaultSource: '[ :dom | 7 ]'  domainObject: nil) value

	"

	| newInstance  |

	newInstance := PUMComputedAttribute new initialize.
	newInstance
		defaultSource: aString ;
		currentSource: aString ;
		domainObject: anObject ;
		sourceType: typeString ;
		compiledMethod: 
			(aBlock isNil
				ifTrue:[ 		aString evaluateInContext: anObject symbolList: GsSession currentSession symbolList ]
				ifFalse:[	aBlock ]) ;
		compiledDefaultMethod: 
			(aBlock isNil
				ifTrue:[ 		aString evaluateInContext: anObject symbolList: GsSession currentSession symbolList ]
				ifFalse:[	aBlock ]).

	^newInstance
