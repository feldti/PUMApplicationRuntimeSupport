swagger support
pumSimpleSwaggerModel

	^(MSKJSONType named: 'MSKRESTError')
			description: 'This object returns additional information about errors' ;
			type: 'object' ;
	        addProperty: ((MSKJSONProperty named: 'errorText')
									required: true ;
									generalType: MSKJSONStringType newInitialized ;
									yourself);
	        addProperty: ((MSKJSONProperty named: 'code')
									required: true ;
									generalType: MSKJSONIntegerType newInt32;													
									yourself);
			yourself