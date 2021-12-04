json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapAccessor: #required.
		mapping mapAllInstVars.
	].