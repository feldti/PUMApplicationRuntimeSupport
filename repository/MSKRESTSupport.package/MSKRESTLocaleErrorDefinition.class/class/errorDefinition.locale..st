services
errorDefinition: errorCode locale: localeString
	"MSKRESTLocaleErrorDefinition errorDefinition: 10 locale: 'us'"

	| localeMessages |

	localeMessages := LocalizedErrorMessages at: localeString asString ifAbsent:[ LocalizedErrorMessages at: self usLocale ].

	^localeMessages get: errorCode