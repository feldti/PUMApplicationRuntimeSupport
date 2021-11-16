starting
startServer: debugFlag httpDebug: httpDebugMode localhost: localhostFlag zmqProtocol: zProtocol interface: zInterface port: zPortNumber logPullPort: zLogPullPort
		"Startet den Server"

	| zmqSocketOptions |
		
	znServer := MSKRESTApiServer on: self port.

	localhostFlag ifTrue:[ znServer bindingAddress: (GsSocket getHostAddressByName: 'localhost') ].

	self zmqContext: (ZMQExtendedContext createContextNamed: 'webCATI').
	
	self zmqContext
		start: 1.

	zmqSocketOptions := (ZMQAllSocketOptions withEndpoint: (ZMQEndpoint protocol: zProtocol interface: zInterface port: zPortNumber) )
										addZeroLinger ;
										connectViaConnect ;
										yourself.

	self zmqPushSocket: (ZMQPushSocket createIn: self zmqContext options: zmqSocketOptions).

	self zmqPushSocket	start.

	znServer 
		debugMode: httpDebugMode ;
		delegate: (MSKRestServerDelegate new 
							restCallServer: self ;
							uriSpace: (ZnCallHierarchyRestUriSpace new 
											rootClass: MSKRestCall
											yourself));
		start.

	SessionTemps current at: #gwcapidebug put: debugFlag.
	SessionTemps current at: #zmqserver put: self.

	self startZMQLogging: zLogPullPort.

	[ true ] whileTrue:[ (Delay forSeconds: 10) wait ].