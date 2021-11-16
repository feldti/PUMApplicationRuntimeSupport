API-helpers
_checkLimitStartAndPage:  someKindOfCATIAPIPagedRequestList options: aMSKRestCallOptions
		"Method comment"

	someKindOfCATIAPIPagedRequestList getLimit isInteger 
		ifFalse:[ self _throwSignalParameterNotDefined:  'limit' options: aMSKRestCallOptions  ].

	(someKindOfCATIAPIPagedRequestList getStart isInteger or:[ someKindOfCATIAPIPagedRequestList getPage isInteger ])
		ifFalse:[ self _throwSignalParameterNotDefined:   'start/page' options: aMSKRestCallOptions ].
