starting
startServer: debugFlag httpDebug: httpDebugMode localhost: localhostFlag
		"Startet den Server"

		znServer := MSKRESTApiServer on: self port.

		localhostFlag ifTrue:[ znServer bindingAddress: (GsSocket getHostAddressByName: 'localhost') ].

		znServer 
			debugMode: httpDebugMode ;
			delegate: (MSKRestServerDelegate new 
								restCallServer: self ;
								uriSpace: (ZnCallHierarchyRestUriSpace new 
												rootClass: MSKRestCall
												yourself));
			start.

		SessionTemps current at: #gwcapidebug put: debugFlag.

		[ true ] whileTrue:[ (Delay forSeconds: 10) wait ].