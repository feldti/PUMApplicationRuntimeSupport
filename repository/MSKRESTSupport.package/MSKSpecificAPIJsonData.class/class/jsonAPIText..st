other
jsonAPIText: apiDeclarationWanted
		"Method comment"

	| resourceListing  |


	(resourceListing := self manualRestCallSuperclass apiDeclarationWanted: apiDeclarationWanted) isNil
		ifTrue:[ resourceListing := self autoRestCallSuperclass apiDeclarationWanted: apiDeclarationWanted ].

	^resourceListing ifNotNil:[ NeoJSONWriter toString: resourceListing ]