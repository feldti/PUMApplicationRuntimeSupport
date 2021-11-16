swagger helpers
addResourceSpecificationTo: aMSKSwaggerResourceListing

	APIDefinitions do:[ :anAPIDeclaration |
		aMSKSwaggerResourceListing 
			addAPIDeclaration: (Dictionary new
											at: 'path' put: anAPIDeclaration path ;
											at: 'description' put: anAPIDeclaration description ;
											yourself)
	].