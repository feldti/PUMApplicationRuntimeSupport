services
createApplicationJSONDescriptionFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	|  aDictionary |

	aDictionary := Dictionary new.

	"Zuerst die SessionID"
	aDictionary
		at: 'application/json' 
		put: 
			(Dictionary new 
				at: 'schema' put:  
					(Dictionary new
						at: '$ref' put: '#/components/schemas/',aMSKExtSwaggerOperation type ;
						yourself) ;
				yourself).

	^aDictionary