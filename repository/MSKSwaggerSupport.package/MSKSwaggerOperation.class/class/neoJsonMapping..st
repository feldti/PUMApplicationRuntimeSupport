json
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #( method nickname type parameters summary notes errorResponses  consumes authorizations)
	].