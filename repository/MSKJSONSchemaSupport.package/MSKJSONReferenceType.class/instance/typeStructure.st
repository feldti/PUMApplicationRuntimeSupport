accessing
typeStructure

	^Dictionary new
			at: '$ref' put: self reference id ;
			yourself
