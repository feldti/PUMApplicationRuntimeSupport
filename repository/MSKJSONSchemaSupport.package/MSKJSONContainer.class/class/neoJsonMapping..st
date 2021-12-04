json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapAccessor: #type to: 'type'.
		mapping mapAccessor: #holdingTypeTypeStructure to: 'items'
	].