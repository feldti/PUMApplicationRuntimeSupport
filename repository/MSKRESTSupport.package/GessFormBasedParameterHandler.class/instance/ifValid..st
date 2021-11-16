services
ifValid: threeArgBlock

	(self defined and:[ (self option validParameterValue: self name value: self parameter)  ] )
			ifTrue:[ threeArgBlock value: self name value: self parameter value: self option request ]