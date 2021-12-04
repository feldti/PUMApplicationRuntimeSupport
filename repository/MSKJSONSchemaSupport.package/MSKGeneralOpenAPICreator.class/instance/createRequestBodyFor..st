services
createRequestBodyFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	|  aDictionary |

	aDictionary := Dictionary new.

	"Zuerst die SessionID"
	aDictionary
		at: 'description' put: aMSKExtSwaggerOperation summary ;
		at: 'required' put: true.

	aMSKExtSwaggerOperation parameters notEmpty
		ifTrue:[
			aDictionary
				at: 'content' put:  (self createApplicationJSONRequestBodyDescriptionFor: aMSKExtSwaggerOperation) 
		].

	^aDictionary