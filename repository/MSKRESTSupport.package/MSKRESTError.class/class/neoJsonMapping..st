json support
neoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #code to: 'code') .
		(mapping mapInstVar: #text to: 'errorText').
	].