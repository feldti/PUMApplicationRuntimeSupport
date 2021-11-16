starting
startZMQLogging: zLogPullPort appName: applicationName

	| zmqSocketOptions |

	zmqSocketOptions := (ZMQAllSocketOptions withEndpoint: (ZMQEndpoint protocol: 'tcp' interface: 'localhost' port: zLogPullPort) )
										addZeroLinger ;
										connectViaConnect ;
										yourself.	
	
	self 
		zmqLogPushSocket: (ZMQPushSocket createIn: self zmqContext options: zmqSocketOptions) ;
		appName: applicationName ;
		appCounter: 0.

	self zmqLogPushSocket start.

	self class msklog: 'I am here and awaiting http/s requests !'.
	self class mskerror: 'This is a NOT an error message'.