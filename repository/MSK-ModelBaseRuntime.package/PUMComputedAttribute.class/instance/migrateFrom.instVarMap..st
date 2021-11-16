migration
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Migration for additional attributes"
	|  oldNames  |

	"First the usual copying of the already known instances variables"
	super migrateFrom: _oldValue instVarMap: _unusedParameter.
	oldNames := _oldValue class allInstVarNames.

	"Neues Attribut compiledDefaultMethod"
	(oldNames includes: #'compiledDefaultMethod') ifFalse:[
		(self defaultSource notNil and:[ self defaultSource notEmpty ])
			ifTrue:[
				self compiledDefaultMethod:  (self defaultSource evaluateInContext: self symbolList: GsSession currentSession symbolList)
			].
	].

	(oldNames includes: #'compiledTS') ifFalse:[ self compiledTS: DateAndTime now ].

	(oldNames includes: #'sourceType') ifFalse:[ self sourceType: 'not set' ].

	(oldNames includes: #'defaultDescription') ifFalse:[ self defaultDescription: '' ].

	(oldNames includes: #'currentDescription') ifFalse:[ self currentDescription: '' ].

	(oldNames includes: #'currentName') ifFalse:[ self currentName: '' ].
 
	(oldNames includes: #'defaultName') ifFalse:[ self defaultName: '' ].


	^self
