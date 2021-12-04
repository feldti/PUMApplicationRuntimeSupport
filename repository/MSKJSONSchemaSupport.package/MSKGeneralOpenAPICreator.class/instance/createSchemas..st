services
createSchemas: componentsObject

	| modelDictionary   |

	modelDictionary := Dictionary new.

	aMSKRestCallV2 buildAPIDefinitionsStructure do: [ :aMSKSwaggerAPIDeclaration |

		aMSKSwaggerAPIDeclaration models associationsDo: [ :eachAssociation | modelDictionary add: eachAssociation].
	].

	modelDictionary keys asSortedCollection do: [ :eachKey |
		|  aDictionary  |

		aDictionary := (modelDictionary at:  eachKey) asDictionary.


	(componentsObject at: 'schemas') at: eachKey put: aDictionary

		"(#( 'CATIAPIError'  'CATIAPIAddressFieldRoleParameterList' 'CATIAPIAddressFieldRoleResultList'  'CATIAPIExecutionHint' 'CATIAPIAddressFieldRole' ) includes: eachAssociation key)
			ifTrue:[ 	(componentsObject at: 'schemas') at: eachAssociation key put: aDictionary ]."
	].

	(componentsObject at: 'schemas') at: 'File' put: MSKJSONType fileDictionary.