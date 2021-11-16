json mapping
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(resultModel).
	].

	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | DateAndTime fromString: string ].
		mapping encoder: [ :dateAndTime | dateAndTime printString ] ].

	mapper for: DateTime customDo: [ :mapping |
		mapping decoder: [ :string | DateTime fromString: string ].
		mapping encoder: [ :dateAndTime | dateAndTime printString ] ].