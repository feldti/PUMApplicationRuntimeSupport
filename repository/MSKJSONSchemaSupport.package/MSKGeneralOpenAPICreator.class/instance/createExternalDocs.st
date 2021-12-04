services
createExternalDocs
	| aDictionary |

	aDictionary := Dictionary new.
	aDictionary
		at: 'description' put: '' ;
		at: 'url' put: ''.

	^aDictionary