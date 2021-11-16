json
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(paramType name description format required minimum maximum enum defaultValue).
		mapping mapInstVar: #dataType to: 'type'

	].