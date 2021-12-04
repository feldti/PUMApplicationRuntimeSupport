initialize
typeStructure

	^Dictionary new
		at: 'type' put: self type ;
		at: 'items' put: self holdingType typeStructure;		
		yourself