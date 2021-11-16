services
indexSpecsForObject: anObject

	^registeredIndices at: anObject ifAbsent:[ OrderedCollection new ]
