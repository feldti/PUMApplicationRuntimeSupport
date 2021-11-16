swagger
apiDeclarationWanted: apiDeclarationWanted

	self allSubclasses do: [ :eachClass |
		(eachClass isSwaggerCall not and: [ eachClass respondsTo: #swaggerAPIDeclaration ])
			ifTrue:[
				(apiDeclarationWanted = eachClass swaggerJSONName) ifTrue:[ ^eachClass swaggerAPIDeclaration ]			
			]
	].

	^nil