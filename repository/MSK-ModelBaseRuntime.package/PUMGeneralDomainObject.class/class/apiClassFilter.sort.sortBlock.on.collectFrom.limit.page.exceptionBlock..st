gsquerysupport
apiClassFilter: filterString sort: sortString sortBlock: aTwoArgBlockOrNil on: items collectFrom: startInteger limit: limitInteger page: pageInteger exceptionBlock: aOneArgBlock
	"^<Array of: filteredCollection of: selectedCollection> Special method to filter, sort and select data"

	| filteredItems sortedItems selectedItems |

		"Nur Studien im Typ: pause, production werden genommen, ebenso muss der State call sein - oder es arbeitet noch jemand auf der Studie"
	filteredItems := self apiClassFilterViaGsQueryFromExtJSFilter: filterString on: items exceptionBlock: aOneArgBlock.
	sortedItems := self apiClassSortFromExtJSSort: sortString on: filteredItems defaultSortBlock: aTwoArgBlockOrNil exceptionBlock: aOneArgBlock.
	
	startInteger isInteger ifFalse:[  aOneArgBlock value:  'start parameter not set' ].
	(limitInteger  isInteger or:[ pageInteger isInteger ]) ifFalse:[  aOneArgBlock value:  'limit parameter not set'].

	selectedItems := sortedItems mskRestStart: startInteger limit: limitInteger page: pageInteger.
	^Array with: filteredItems with: selectedItems
