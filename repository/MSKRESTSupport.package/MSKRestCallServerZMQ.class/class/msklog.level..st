other
msklog: aString level: levelString
	| logServer aZMQTelegram |

	(logServer := SessionTemps current at: #zmqserver ifAbsent:[ nil ]) isNil ifTrue:[ 
		GsFile mskerror: 'No ZMQ Server defined'.
		^self ].

	(aZMQTelegram := ZMQTelegram msklogTelegram: aString level: levelString)  isNil ifTrue:[ 
		GsFile mskerror: 'No ZMQ Server defined'.
		^self ].

	logServer 
		increaseAppCounter ;
		sendZMQLogTelegram: aZMQTelegram