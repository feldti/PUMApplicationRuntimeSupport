*MSKRESTSupport
mskIsValidUploadFilename
	"^<Boolean> Gibt true zurück, falls der Name gültig ist.

		Was bedeutet gültig ? A-Z,a-z,-_,0-9

		'säf' asUnicodeString mskIsValidUploadFilename
		'saf' asUnicodeString mskIsValidUploadFilename
		'sa12f' asUnicodeString mskIsValidUploadFilename

	"

	self do: [ :eachCharacter | (eachCharacter = $. or:[ eachCharacter = $_ or:[ eachCharacter = $- or:[ (eachCharacter codePoint > 47) and:[ (eachCharacter codePoint <= 122) and:[ eachCharacter isAlphaNumeric ]]]]]) ifFalse:[ ^false ]].


	^true