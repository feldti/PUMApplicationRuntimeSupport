json
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(apiVersion swaggerVersion basePath description resourcePath  models  path apis produces authorizations)
	].