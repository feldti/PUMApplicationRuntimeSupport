starting
startZMQLogging: zLogPullPort

	| zmqSocketOptions |

	zmqSocketOptions := (ZMQAllSocketOptions withEndpoint: (ZMQEndpoint protocol: 'tcp' interface: 'localhost' port: zLogPullPort) )
										addZeroLinger ;
										connectViaConnect ;
										yourself.	
	
	self zmqLogPushSocket: (ZMQPushSocket createIn: self zmqContext options: zmqSocketOptions).

	self znServer isNil
		ifTrue:[ 		self appName: 'app-srv']
		ifFalse:[ 	self appName: 'app-rest',self znServer port asString ].

	self appCounter: 0.
	self zmqLogPushSocket start.

	self class msklog: 'I am here and awaiting http/s requests !'.
	self class mskerror: 'This is a NOT an error message'.