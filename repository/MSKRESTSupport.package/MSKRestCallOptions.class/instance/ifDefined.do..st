Accessing
ifDefined: name do: aBlock
		"Method comment"

	(userDefinedAttributes includesKey: name)
		ifTrue:[ aBlock value: (userDefinedAttributes at: name) ]