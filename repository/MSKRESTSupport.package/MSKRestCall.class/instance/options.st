api methods
options
	^ (MSKRESTAPIAnswer badRequestFor: self object: 'wrong method')
			yourself