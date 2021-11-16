testing
isParameterInFormDefined: name 
	"^<Boolean> Returns true if an entry named <name> can be found in the form values" 

	formUrlEncodedEntity ifNil:[ ^false ].
	^(formUrlEncodedEntity at: name ifAbsent:[ nil ]) notNil