gsquerysupport
apiClassFilterViaGsQueryFromExtJSFilter: filterString on: items exceptionBlock: aOneArgBlock
	"Spezielle Methode f?r diese Klasse um einen passenden Query String zu bauen

							

	"

	| aGsQuery       |

	(filterString == UndefinedObject or:[ filterString isEmptyOrNil or:[ filterString trimBlanks = '[]' ] ]) ifTrue:[ ^items ]. 

	aGsQuery := self apiClassBuildGsQueryFromExtJSFilter: filterString exceptionBlock: aOneArgBlock.
	^(aGsQuery on: items asIdentitySet) asIdentityBag
