instance creation
withRESTCall: restCall operation: aMSKSwaggerOperation


	^self new initialize
		restCallInstance: restCall ;
		operation: aMSKSwaggerOperation ;
		yourself