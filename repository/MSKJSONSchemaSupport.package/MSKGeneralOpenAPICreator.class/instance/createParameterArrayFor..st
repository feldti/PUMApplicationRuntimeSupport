services
createParameterArrayFor: aMSKExtSwaggerOperation
	"^<Dictionary>"
	| anArray aDictionary |

	anArray := Array new.
	aDictionary := Dictionary new.

	"Zuerst die SessionID"
	aDictionary
		at: 'name' put: 'sessionID' ;
		at: 'description' put:  'Beschreibt die ID der Session';
		at: 'in' put: 'query' ;
		at: 'required' put: true ;
		at: 'deprecated' put: false ;
		at: 'allowEmptyValue' put: false ;
		at: 'schema' put: (Dictionary new at: 'type' put: 'integer' ; yourself).

	^Array new
			add: aDictionary ;
			yourself.