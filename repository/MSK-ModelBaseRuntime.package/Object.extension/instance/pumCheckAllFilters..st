*MSK-ModelBaseRuntime
pumCheckAllFilters: arrayOfFilters

	^(arrayOfFilters 
			detect: [ :eachFilterBlock | (eachFilterBlock value: self) not ]
			ifNone:[ nil ]) isNil
