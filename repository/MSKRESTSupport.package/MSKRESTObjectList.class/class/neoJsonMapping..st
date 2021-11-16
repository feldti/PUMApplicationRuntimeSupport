json-support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(items total limit offset)
	].