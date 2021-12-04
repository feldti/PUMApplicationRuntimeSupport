services
createPOSTDescriptionFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	| aDictionary |

	aDictionary := Dictionary new.
	aDictionary
		at: 'summary' put: aMSKExtSwaggerOperation summary ;
		at: 'description' put:  aMSKExtSwaggerOperation notes ;
		at: 'operationId' put:  aMSKExtSwaggerOperation nickname ;
		at: 'responses' put: (self createDefaultResponsesFor: aMSKExtSwaggerOperation).

	aMSKExtSwaggerOperation parameters notEmpty
		ifTrue:[ aDictionary	at: 'requestBody' put:  (self createRequestBodyFor: aMSKExtSwaggerOperation) ].

	aMSKExtSwaggerOperation checkSession
		ifTrue:[ aDictionary at: 'parameters' put:  (self createParameterArrayFor: aMSKExtSwaggerOperation) ].

	^aDictionary.