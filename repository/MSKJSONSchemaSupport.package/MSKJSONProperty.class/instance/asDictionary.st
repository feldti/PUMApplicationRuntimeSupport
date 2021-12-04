conversion
asDictionary
	| aDictionary |

	aDictionary := self generalType typeStructure.

	(self enumValues notNil and:[ self enumValues notEmpty ]) ifTrue:[ aDictionary at: 'enum' put: self enumValues ].
	self description ifNotNil:[ :el | aDictionary at: 'description' put: el ].

	^aDictionary