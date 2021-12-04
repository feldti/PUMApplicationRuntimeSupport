services
createComponentsObject
	| aDictionary |

	aDictionary := Dictionary new.

	aDictionary
		at: 'schemas' put: OrderPreservingDictionary new.

	^aDictionary