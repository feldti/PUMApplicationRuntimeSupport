api methods
get
	^ (MSKRESTAPIAnswer badRequestFor: self object: 'wrong method')
			yourself