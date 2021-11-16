gsquerysupport
apiClassFilter: aPagedRequestInstance sortBlock: aTwoArgBlockOrNil on: items exceptionBlock: aOneArgBlock
	"^<Array of: filteredcollection of: selectedcollection> Special method to filter, sort and select data"

	^self 
		apiClassFilter: aPagedRequestInstance getFilter 
		sort: aPagedRequestInstance getSort 
		sortBlock: aTwoArgBlockOrNil 
		on: items 
		collectFrom: aPagedRequestInstance getStart 
		limit: aPagedRequestInstance getLimit 
		page: aPagedRequestInstance getPage 
		exceptionBlock: aOneArgBlock
