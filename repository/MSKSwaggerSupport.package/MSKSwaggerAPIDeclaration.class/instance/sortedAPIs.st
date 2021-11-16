Accessing
sortedAPIs

	| sortedCollection rc|

	sortedCollection := SortedCollection sortBlock:[ :a :b | a path  <  b path ].
	sortedCollection addAll: self apis.
	rc := sortedCollection asOrderedCollection.
	self halt.
	^rc