api definitions cache
clearAPIDefinitions
	"GWCRestCallV2 clearAPIDefinitions"

	APIDefinitions := SortedCollection sortBlock: [ :a :b | a basePath < b basePath].