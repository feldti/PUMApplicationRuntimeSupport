instance creation
code: anInteger text: aString
	"^<self> Erzeugt eine einzelne Fehlerbeschreibung"

	^self new initialize
		code:anInteger ;
		text: aString ;
		yourself