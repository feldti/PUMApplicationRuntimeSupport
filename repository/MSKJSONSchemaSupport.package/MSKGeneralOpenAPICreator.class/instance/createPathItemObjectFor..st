services
createPathItemObjectFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	| aDictionary  |

	aDictionary := Dictionary new.
	
	aDictionary 
		at: aMSKExtSwaggerOperation method asLowercase
		put: (self createPOSTDescriptionFor: aMSKExtSwaggerOperation).
	
	^aDictionary