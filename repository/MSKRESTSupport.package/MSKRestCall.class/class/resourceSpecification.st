swagger
resourceSpecification

	| aMSKSwaggerResourceListing swaggerInfo |

	aMSKSwaggerResourceListing := MSKSwaggerResourceListing new initialize.
	aMSKSwaggerResourceListing
			apiVersion: self defaultAPIVersion ;
			swaggerVersion: self defaultSwaggerVersion ;
			yourself.

	(swaggerInfo := self createSwaggerInfo) ifNotNil:[ aMSKSwaggerResourceListing info: swaggerInfo ].
	self allSubclasses do: [ :eachClass |
		(eachClass isSwaggerCall not and: [ eachClass respondsTo: #swaggerAPIDeclaration ])
			ifTrue:[
				| aDictionary anAPIDeclaration |
				anAPIDeclaration := eachClass swaggerAPIDeclaration.
				aDictionary := Dictionary new
										at: 'path' put: anAPIDeclaration path ;
										at: 'description' put: anAPIDeclaration description ;
										yourself.
				aMSKSwaggerResourceListing addAPIDeclaration: aDictionary
			]
	].

	^aMSKSwaggerResourceListing