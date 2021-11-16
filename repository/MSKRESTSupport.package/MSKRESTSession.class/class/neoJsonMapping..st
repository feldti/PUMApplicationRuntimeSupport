json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapAccessor: #resourceURL to: 'resource'.
		mapping mapInstVars: #(location closed expiration).
		(mapping mapInstVar: #lastActivity to: 'lastactivity') valueSchema: DateAndTime.
	].

	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | DateAndTime fromString: string ].
		mapping encoder: [ :dateAndTime | dateAndTime printString ] ].