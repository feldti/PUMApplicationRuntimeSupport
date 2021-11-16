services
buildInGsQueryString: blockSourceStream propertyName: propertyName mappingValues: mappingValues value: convertedValues
	| firstElement |

	firstElement := true.

	convertedValues do: [ :eachConvertedValue | | variableName |
		firstElement ifFalse:[ blockSourceStream space ; nextPut: $| ; space ].

		blockSourceStream 
			nextPutAll: '(each.' ;
			nextPutAll: propertyName ;
			space ;
			nextPut: $= ;
			space.

		variableName := 'p',counter asString.
		counter := counter + 1.
		mappingValues at: variableName put: (eachConvertedValue at: 1).				

		blockSourceStream 
			nextPutAll: variableName ;
			nextPut: $).

		firstElement := false.
	]