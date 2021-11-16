json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapAccessor: #sortedAPIs to: 'apis'.
		mapping mapInstVars: #(apiVersion swaggerVersion info basePath)
	].