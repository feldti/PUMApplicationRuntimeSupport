swagger helpers
apiDeclarationWanted: apiDeclarationWanted


	^APIDefinitions
		detect: [ :eachAPIDeclaration | apiDeclarationWanted = eachAPIDeclaration jsonName ]
		ifNone:[ nil ]