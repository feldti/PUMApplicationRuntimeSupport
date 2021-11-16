services
buildGsQuery
	"
		Die Annahme ist die, dass der Client die Parametervalue IMMER als Strings anliefern
	"
	| buildMappings |

	buildMappings := self buildGsQueryStringAndMappings.
	gsQuery := GsQuery fromString: buildMappings first.

	buildMappings last keysAndValuesDo: [ :key :value |
		gsQuery map: key to: value ].

	^gsQuery