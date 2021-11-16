json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name version protocol)
	].