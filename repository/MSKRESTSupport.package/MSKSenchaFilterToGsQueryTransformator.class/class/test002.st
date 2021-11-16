examples
test002
	"MSKSenchaFilterToGsQueryTransformator test002"

	| transformator |

	transformator := self
								domainClass: CATIAPIAddressQueue 
								filterInstructions: (Array with: (Dictionary new
																				at: 'operator' put: '=' ;
																				at: 'value' put: 'Mama' ;
																				at: 'property' put: 'name' ;
																			yourself) 
																	with: (Dictionary new
																				at: 'operator' put: '=' ;
																				at: 'value' put: 'Papa' ;
																				at: 'property' put: 'name' ;
																			yourself)).

	^transformator buildGsQueryStringAndMappings