Accessing
setErrorWithinResultModel: aString
		"Method comment"

	self success: false.
	self resultModel isNil ifFalse:[ self resultModel setData: nil ; setError: (MSKRESTError code: -1 text: aString) ].