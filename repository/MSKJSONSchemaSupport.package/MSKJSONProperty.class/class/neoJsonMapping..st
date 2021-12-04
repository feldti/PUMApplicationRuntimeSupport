json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapAccessor: #format .
		mapping mapAccessor: #type .
		mapping mapAccessor: #referenceName to: '$ref'.
		mapping mapAccessor: #items.
		mapping mapAccessor: #enumValues.
	].