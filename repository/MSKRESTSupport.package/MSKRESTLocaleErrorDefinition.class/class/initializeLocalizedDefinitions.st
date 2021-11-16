initialize
initializeLocalizedDefinitions
	"MSKRESTLocaleErrorDefinition initializeLocalizedDefinitions"

	LocalizedErrorMessages := StringKeyValueDictionary new.
	
	LocalizedErrorMessages
		at: self usLocale put:(self createUSErrorCodes).

	^LocalizedErrorMessages