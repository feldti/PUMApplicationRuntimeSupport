*MSKRESTSupport
asMSKRestPath
	"^<MSKRestPath>

		#('gwc' 'test' '{test}') asMSKRestPath
	"

	^self 
		inject: MSKRestPath new initialize 
		into: [ :aMSKPath :aString |
			(aString notEmpty and: [ aString first = ${ and: [ aString last = $} ]])
				ifTrue:[ aMSKPath add: (aString copyFrom: 2 to: aString size - 1 ) asMSKRestVariablePathSegment ]
				ifFalse:[ aMSKPath add: aString asMSKRestConstantPathSegment ].
			aMSKPath
	]