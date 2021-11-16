instance creation
domainClass: aDomainClass filterInstructions: filterDictionary
	"Erzeugt einen GsQuery String auf Basis einer ExtJS Filtering Definition"

	^self new
			domainClass: aDomainClass ;
			filterInstructions: filterDictionary ;
			yourself