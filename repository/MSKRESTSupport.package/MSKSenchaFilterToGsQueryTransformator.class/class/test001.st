examples
test001
	"MSKSenchaFilterToGsQueryTransformator test001"

	| transformator |

	transformator := self
								domainClass: CATIAPIAddressQueue 
								filterInstructions: (Array with: (Dictionary new
																				at: 'operator' put: '=' ;
																				at: 'value' put: 'Mama' ;
																				at: 'property' put: 'name' ;
																			yourself)).

	^transformator buildGsQueryStringAndMappings