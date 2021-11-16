gsquerysupport
apiClassBuildGsQueryFromExtJSFilter: filterString exceptionBlock: aOneArgBlock
	"Spezielle Methode f?r diese Klasse um einen passenden Query String zu bauen


		CATIAPIAddressQueueMembership
			buildGsQueryFromExtJSFilter: (Array 
															with: (Dictionary new at: 'operator' put: '=' ; at:'value' put: 12 ; at: 'property' put: 'aid' ; yourself) 
															with: (Dictionary new at: 'operator' put: '=' ; at:'value' put: 12 ; at: 'property' put: 'aid' ; yourself) )														

	"

	| aGsQuery querySourceStream clauseCounter firstClause mappings  filterDictionary |

	filterDictionary := NeoJSONReader fromString: filterString.
	clauseCounter := 0.
	firstClause := true.
	querySourceStream := WriteStream on: String new.
	mappings := Dictionary new.

	filterDictionary do: [ :eachFilterDictionary |
		| operator propertyName propertyAccessPath value  convertedValue  mapVariableName aBlock |

		operator := eachFilterDictionary at: 'operator' ifAbsent:[ '=' ].
		propertyName := eachFilterDictionary at: 'property' ifAbsent:[ aOneArgBlock value:  'No property set in filter description' ].
		value := eachFilterDictionary at: 'value' ifAbsent:[ aOneArgBlock value:   'No value set in filter description' ].

		firstClause ifFalse:[ querySourceStream nextPutAll: ' & ' ].
		querySourceStream nextPutAll: '(' .

		(operator = 'in' or:[ operator = 'notin' ])
			ifTrue:[
				| orFirstClause |
				value isCollection ifFalse:[ aOneArgBlock value:  'Value ',value asString,' attribute of IN filter statement is not an array of values'   ].
				value isEmpty ifTrue:[ aOneArgBlock value:  'Value ',value asString,' attribute of IN filter statement is an empty array of values'   ].

				orFirstClause := true.

				querySourceStream nextPutAll: '(' .
				value do: [ :eachINValue |
					orFirstClause ifFalse:[ querySourceStream nextPutAll: ' | ' ].

					"Ist das Attribut NICHT Teil der AQM-Klasse, dann ist es Teil der Adresse und ist abh?ngig von der Studie"
					(propertyAccessPath := self apiClassGetDomainPropertyAccessorPath: propertyName) isNil 
						ifTrue:[
							aOneArgBlock value:   'Attribute ',propertyName asString,' unknown' 
						]
						ifFalse:[
							querySourceStream nextPut: $( ; nextPutAll: propertyAccessPath.
							aBlock := self apiClassGetDomainPropertyConversionSourcetext: propertyName.
							convertedValue := aBlock value: eachINValue.				
						].

					querySourceStream space ; nextPutAll: '='  .
					mapVariableName := 'mapValue',clauseCounter asString.

					querySourceStream space ; nextPutAll: mapVariableName ; nextPut: $).
					
					mappings at: mapVariableName put: convertedValue.

					"GsFile msklog: mapVariableName,' -> ',convertedValue asString,' (',convertedValue class name asString."

					clauseCounter := clauseCounter + 1.
					orFirstClause := false.
				].
				querySourceStream nextPutAll: ')'.

				operator = 'notin' ifTrue:[ querySourceStream space ; nextPutAll: 'not' ].
	
				firstClause := false.
			]
			ifFalse:[
				| attributeAccess |

				attributeAccess := WriteStream on: Unicode16 new.
				"Ist das Attribut NICHT Teil der AQM-Klasse, dann ist es Teil der Adresse und ist abh?ngig von der Studie"
				(propertyAccessPath := self apiClassGetDomainPropertyAccessorPath: propertyName) isNil 
					ifTrue:[
						aOneArgBlock value:    'Attribute ',propertyName asString,' unknown' 
					]
					ifFalse:[
						attributeAccess nextPutAll: propertyAccessPath.
						aBlock := self apiClassGetDomainPropertyConversionSourcetext: propertyName.
						convertedValue := aBlock value: value.				
					].

				mapVariableName := 'mapValue',clauseCounter asString.
				mappings at: mapVariableName put: convertedValue.
				clauseCounter := clauseCounter + 1.

				operator = '*=' 
					ifTrue:[
						| correctedMapVariableName upperLimitValue |
						convertedValue isString
							ifFalse:[ aOneArgBlock value:    '*= Operator only works on DataType Strings '].
						upperLimitValue := convertedValue pumUpperlimitValue.
						correctedMapVariableName := 'mapValue',clauseCounter asString.
						mappings at: correctedMapVariableName put: upperLimitValue.
						clauseCounter := clauseCounter + 1.

						"firstClause ifFalse:[ querySourceStream nextPutAll: ' & ' ]."
						querySourceStream 
							nextPutAll: '('  ;
							space ; nextPutAll: mapVariableName ;
							nextPutAll: ' <= ' ;
							space ; nextPutAll: attributeAccess contents ;
							nextPutAll: ') & (' ;
							space ; nextPutAll: correctedMapVariableName ;
							nextPutAll: ' > ' ;
							space ; nextPutAll: attributeAccess contents ;
							nextPutAll: ')'.
					]
					ifFalse:[		

						querySourceStream space ; nextPutAll: attributeAccess contents.

						operator = '<' ifTrue:[ querySourceStream nextPutAll: ' < ' ].
						operator = '<=' ifTrue:[querySourceStream nextPutAll: ' <= ' ].
						operator = '=' ifTrue:[ querySourceStream nextPutAll: ' = ' ].
						operator = '==' ifTrue:[ querySourceStream nextPutAll: ' = ' ].
						operator = '>=' ifTrue:[ querySourceStream nextPutAll: ' >= ' ].
						operator = '>' ifTrue:[ querySourceStream nextPutAll: ' > ' ].
						operator = '!=' ifTrue:[ querySourceStream nextPutAll: ' ~= ' ].

						querySourceStream space ; nextPutAll: mapVariableName.
				].


				firstClause := false.
		].
		querySourceStream nextPutAll: ')'.
	].
	
	GsFile msklog: querySourceStream contents.

	aGsQuery := GsQuery fromString: querySourceStream contents.
	mappings keysAndValuesDo: [ :key :value | aGsQuery bind: key to: value ].
	^aGsQuery
