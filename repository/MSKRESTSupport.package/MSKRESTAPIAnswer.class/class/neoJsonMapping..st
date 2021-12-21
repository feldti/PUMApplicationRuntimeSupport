json mapping
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(success data error).
		mapping mapAccessors: #(dbgms dbgss dbgloc dbgapi dbgts).
	].

	mapper for: SmallDateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | MSKTimeStampConverter nowUTCFromJavascript: string ].
		mapping encoder: [ :dateAndTime | MSKTimeStampConverter dateAndTimeUTCAsJavascript: dateAndTime ] ].

	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | MSKTimeStampConverter nowUTCFromJavascript: string ].
		mapping encoder: [ :dateAndTime | MSKTimeStampConverter dateAndTimeUTCAsJavascript: dateAndTime ] ].

	mapper for: DateTime customDo: [ :mapping |
		mapping decoder: [ :string | DateTime fromString: string ].
		mapping encoder: [ :dateAndTime | dateAndTime printString ] ].