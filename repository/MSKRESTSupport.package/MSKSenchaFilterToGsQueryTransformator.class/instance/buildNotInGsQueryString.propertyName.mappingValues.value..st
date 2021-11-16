services
buildNotInGsQueryString: blockSourceStream propertyName: propertyName mappingValues: mappingValues value: convertedValues

	blockSourceStream 
		nextPut: $(.

	self buildInGsQueryString: blockSourceStream propertyName: propertyName mappingValues: mappingValues value: convertedValues.

	blockSourceStream 
		nextPutAll: ') not'