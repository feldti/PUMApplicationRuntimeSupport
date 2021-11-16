starting
sendZMQLogTelegram: aZMQTelegram

	zmqLogPushSocket notNil 
			ifTrue:[
				zmqLogPushSocket sendTelegram: aZMQTelegram.
			]