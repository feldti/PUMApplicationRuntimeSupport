zeromq-support
sendZMQTelegram: aZMQTelegram

	zmqPushSocket notNil 
		ifTrue:[
			zmqPushSocket sendTelegram: aZMQTelegram.
		]