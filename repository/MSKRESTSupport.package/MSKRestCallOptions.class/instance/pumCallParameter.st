Accessing
pumCallParameter

	| result |

	self
		ifParameterDefined: 'MessageParameter' 
		do: [ :pVal :options | result := pVal ].

	^result