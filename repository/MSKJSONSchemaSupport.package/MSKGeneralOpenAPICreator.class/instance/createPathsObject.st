services
createPathsObject
	| aDictionary aSortedCollection pathDictionary |

	pathDictionary := Dictionary new.
	aDictionary := OrderPreservingDictionary new.
	aSortedCollection := SortedCollection sortBlock: [ :a :b | a nickname < b nickname ].

	aMSKRestCallV2 buildAPIDefinitionsStructure  do: [ :aMSKSwaggerAPIDeclaration |
		aMSKSwaggerAPIDeclaration apis  do: [ :aMSKSwaggerSingleAPIDeclaration |
			aSortedCollection add: aMSKSwaggerSingleAPIDeclaration operations first.
			pathDictionary at: aMSKSwaggerSingleAPIDeclaration operations first put: aMSKSwaggerSingleAPIDeclaration path.
		]
	].

	aSortedCollection do: [ :eachMSKExtSwaggerOperation |
			aDictionary
				at: (pathDictionary at: eachMSKExtSwaggerOperation)  put: (self createPathItemObjectFor: eachMSKExtSwaggerOperation)
	].

	^aDictionary