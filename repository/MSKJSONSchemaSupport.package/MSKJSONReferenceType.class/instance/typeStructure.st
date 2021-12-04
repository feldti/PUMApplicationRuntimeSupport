accessing
typeStructure

	^Dictionary new
			at: '$ref' put: '#/components/schemas/',self reference value id ;
			yourself