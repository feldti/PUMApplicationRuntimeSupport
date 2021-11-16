starting
startServer
		"Startet den Server"

		znServer := MSKRESTApiServer startOn: self port.
		znServer 
			delegate: (MSKRestServerDelegate new 
								restCallServer: self ;
								uriSpace: (ZnCallHierarchyRestUriSpace new 
												rootClass: MSKRestCall ;
												yourself)).


		[ true ] whileTrue:[ (Delay forSeconds: 10) wait ].