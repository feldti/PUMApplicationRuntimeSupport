*MSKJSONSchemaSupport
openAPIKeysAndValuesDo: aBlock

	^self orderedKeys do: [:each |
		each ifNotNil:[ :el |
			aBlock
				value: el
				value: (dictionary at: el)
		]
	]