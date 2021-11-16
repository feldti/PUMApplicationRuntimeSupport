services
for: possibleValue do: twoArgBlock

	self parameter = possibleValue ifTrue:[ ^twoArgBlock value: parameter value: self option request]