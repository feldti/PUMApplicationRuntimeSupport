*MSKRESTSupport
mskRestStart:start limit: limit	page: page

	| sortedCollection |

	sortedCollection := SortedCollection sortBlock:[ :a :b | a getEnteredTS < b getEnteredTS ].
	sortedCollection addAll: self.

	^sortedCollection mskRestStart:start limit: limit	page: page