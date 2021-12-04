conversion
asDictionary

	| aDictionary sortedCollection orderPreservingDictionary |

	orderPreservingDictionary := OrderPreservingStringDictionary new.

	sortedCollection := SortedCollection sortBlock: [ :a :b | a name < b name ].
	sortedCollection addAll: self properties.

	sortedCollection do: [ :eachMSKJSONProperty |
		orderPreservingDictionary at: eachMSKJSONProperty name put: eachMSKJSONProperty asDictionary
	].

	aDictionary := 
		Dictionary new
			at: 'type' put: self type  ;
			at: 'properties' put: orderPreservingDictionary ;
			yourself.

	self description ifNotNil:[ :el | aDictionary at: 'description' put: el ].

	^aDictionary