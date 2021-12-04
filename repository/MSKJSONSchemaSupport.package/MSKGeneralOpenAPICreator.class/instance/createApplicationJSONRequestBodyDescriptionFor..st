services
createApplicationJSONRequestBodyDescriptionFor: aMSKExtSwaggerOperation
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
						at: '$ref' put: '#/components/schemas/',aMSKExtSwaggerOperation parameters first  dataType ;
						yourself) ;
				yourself).

	^aDictionary