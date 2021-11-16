api methods
post
	^ (MSKRESTAPIAnswer badRequestFor: self object: 'wrong method')
			yourself