swagger helpers
addOperationNamesOf: tempAPIDeclaration to: aDictionary

		tempAPIDeclaration apis do:[ :eachMSKSwaggerSingleAPIDeclaration |
			eachMSKSwaggerSingleAPIDeclaration operations do:[ :eachSwaggerOperation |
				aDictionary at: eachSwaggerOperation nickname put: eachSwaggerOperation
			]
		].