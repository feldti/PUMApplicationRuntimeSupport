*MSKSwaggerSupport
swaggerMatch: request

	System abortTransaction.

	rootClass withAllSubclassesDo: [ :each |
		(each swaggerMatch: request)
			ifNotNil: [ :variables |
				^ each new
					variables: variables;
					yourself ] ].
	^ nil