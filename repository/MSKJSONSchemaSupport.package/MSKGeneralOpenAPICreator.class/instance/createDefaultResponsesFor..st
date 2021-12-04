services
createDefaultResponsesFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	|  aDictionary |

	aDictionary := Dictionary new.

	aMSKExtSwaggerOperation type isNil
		ifFalse:[
			"Zuerst die SessionID"
			aDictionary
				at: '200' put: 
					(Dictionary new
						at: 'description' put: '200 means valid server response - the caller always has to look at the success property for true call-success or a failure. If a failure has been detected, additional information can be found in the error object' ;
						at: 'content' put: 
							(Dictionary new
								at: 'application/json' put: 
									(Dictionary new 
										at: 'schema' put:  
											(Dictionary new
												at: '$ref' put: '#/components/schemas/',aMSKExtSwaggerOperation type ;
												yourself) ;
										yourself) ;
								yourself);
						yourself
					)
		].

	^aDictionary