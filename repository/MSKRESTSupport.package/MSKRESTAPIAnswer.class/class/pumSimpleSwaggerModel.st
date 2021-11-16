swagger support
pumSimpleSwaggerModel

	^(MSKJSONType named: 'MSKRESTAPIAnswer')
			description: 'Default Answer Class' ;
			type: 'object' ;
	        addProperty: ((MSKJSONProperty named: 'success')
									required: true ;
									generalType: (MSKJSONTypedType new initialize
															type: 'boolean' ;
															yourself) ;
									yourself);
	        addProperty: ((MSKJSONProperty named: 'dbgms')
									required: false ;
									generalType: MSKJSONIntegerType newInt32;													
									yourself);
	        addProperty: ((MSKJSONProperty named: 'dbgss')
									required: false ;
									generalType: MSKJSONIntegerType newInt32;													
									yourself);
	        addProperty: ((MSKJSONProperty named: 'dbgloc')
									required: false ;
									generalType: (MSKJSONTypedType new initialize
															type: 'string' ;
															yourself) ;
									yourself);
	        addProperty: ((MSKJSONProperty named: 'dbgapi')
									required: false ;
									generalType: (MSKJSONTypedType new initialize
															type: 'string' ;
															yourself) ;
									yourself);
			addProperty: ((MSKJSONProperty named: 'error')
									required: false ;
									generalType: (MSKJSONReferenceType with: MSKRESTError pumSimpleSwaggerModel);
									yourself);

			yourself