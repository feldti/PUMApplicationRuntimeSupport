services
buildGsQueryStringAndMappings
	"
		Die Annahme ist die, dass der Client die Parametervalue IMMER als Strings anliefern
	"
	| mappingValues blockSourceStream firstElement   |


	(domainClass isNil or:[ filterInstructions isNil or:[ filterInstructions isEmpty ]  ]) ifTrue:[ ^nil	].

	mappingValues := Dictionary new.
	firstElement := true.
	blockSourceStream := WriteStream on: String new.
	counter := 0.

	filterInstructions collect: [ :eachFilterDictionary |
		| multiOperator operator propertyName propertyAccessor  variableName value stringToNativeValueConversionBlock convertedValues |

		firstElement ifFalse:[ blockSourceStream space ; nextPut: $& ; space ].

		operator := eachFilterDictionary at: 'operator' ifAbsent:[ MSKGsQueryTranslatorError new errorMessage: 'No Operator defined' ; signal ].
		(operator = 'like' or:[ operator = '/=' ])
			ifTrue:[ MSKGsQueryTranslatorUnsupportedOperatorError new signal ].
		multiOperator := operator = 'in'  or:[ operator = 'notin' ].

		propertyName := eachFilterDictionary at: 'property' ifAbsent:[ MSKGsQueryTranslatorError new errorMessage: 'No Property defined' ; signal ].

		"Ist das Attribut Teil der API Domain Klasse ?"
		(propertyAccessor := domainClass getDomainPropertyAccessor: propertyName) isNil 
			ifTrue:[
				MSKGsQueryTranslatorError new errorMessage: ('Property ',propertyName,' not known in target class ',domainClass name asString) ; signal
			].
		value := eachFilterDictionary 
						at: 'value'
						ifAbsent:[ MSKGsQueryTranslatorError new errorMessage: 'No Value defined' ; signal  ].
		value := (value isSequenceable and:[ value isCharacterCollection not ]) ifTrue:[ value ] ifFalse:[ Array with: value ].

		stringToNativeValueConversionBlock := domainClass getDomainPropertyConversionSourcetext: propertyName.
		convertedValues := value collect: [ :eachSingleValue | stringToNativeValueConversionBlock value: eachSingleValue ].

		blockSourceStream nextPut: $( ; nextPutAll: 'each.' ; nextPutAll: propertyName.

		multiOperator
			ifTrue:[ 
				operator = 'in' ifTrue:[ self buildInGsQueryString: blockSourceStream propertyName: propertyName mappingValues: mappingValues value: convertedValues ].
				operator = 'notin' ifTrue:[  self buildNotInGsQueryString: blockSourceStream propertyName: propertyName mappingValues: mappingValues value: convertedValues  ].
			]
			ifFalse:[

				operator = '<' ifTrue:[ blockSourceStream space ; nextPut: $< ; space  ].
				operator = '<=' ifTrue:[blockSourceStream space ; nextPutAll: '<=' ; space ].
				operator = '=' ifTrue:[ blockSourceStream space ; nextPut: $= ; space ].
				operator = '==' ifTrue:[ blockSourceStream space ; nextPut: $= ; space ].
				operator = '!=' ifTrue:[ blockSourceStream space ; nextPutAll: '~='  ; space].
				operator = '>=' ifTrue:[ blockSourceStream space ; nextPutAll: '>=' ; space ].
				operator = '>' ifTrue:[ blockSourceStream space ; nextPut: $> ; space ].		

				variableName := 'p',counter asString.
				counter := counter + 1.
				mappingValues at: variableName put: (convertedValues at: 1).				

				blockSourceStream 
					space ; 
					nextPutAll: variableName 
			].

		blockSourceStream nextPut: $).

		firstElement := false
	].

	^Array with: blockSourceStream contents with: mappingValues