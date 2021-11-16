Accessing
ifParameterDefined: name do: aBlock else: anotherBlock
		"Method comment"

	(userDefinedAttributes includesKey: name)
		ifTrue:[ aBlock value: (userDefinedAttributes at: name) value: self ]
		ifFalse:[ anotherBlock value: name value: self ]