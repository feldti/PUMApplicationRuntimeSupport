services
ifDefined: twoArgBlock

	(self defined and:[ self parameter ~= 'undefined'])  ifTrue:[ twoArgBlock value: self parameter value: self option request ]