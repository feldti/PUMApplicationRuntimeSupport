adding
sortedAPIs

	| sortedCollection |

	sortedCollection := SortedCollection sortBlock: [ :a :b | (a at: 'path') < (b at: 'path') ].
	sortedCollection addAll: self apis.
	^sortedCollection