starting
startZMQOnlyServer: zProtocol interface: zInterface port: zPortNumber  logPullPort: zLogPullPort
		"Startet den Server"

	| zmqSocketOptions |
		
	self zmqContext: (ZMQExtendedContext createContextNamed: 'webCATI').
	
	self zmqContext
		start: 1.

	zmqSocketOptions := (ZMQAllSocketOptions withEndpoint: (ZMQEndpoint protocol: zProtocol interface: zInterface port: zPortNumber) )
										addZeroLinger ;
										connectViaConnect ;
										yourself.

	self zmqPushSocket: (ZMQPushSocket createIn: self zmqContext options: zmqSocketOptions).
	self zmqPushSocket	start.

	SessionTemps current at: #zmqserver put: self.

	self startZMQLogging: zLogPullPort