instance creation
defaultSource: aString domainObject: anObject
	"
		(PUMComputedAttribute defaultSource: '[ :dom | 7 ]'  domainObject: nil) value

	"

	| newInstance compiledMethod |

	newInstance := PUMComputedAttribute new initialize.
	newInstance
		defaultSource: aString ;
		currentSource: aString ;
		domainObject: anObject.

	compiledMethod :=
		aString
			evaluateInContext: anObject
			symbolList: GsSession currentSession symbolList.

	newInstance
		compiledMethod: compiledMethod.

	^newInstance
