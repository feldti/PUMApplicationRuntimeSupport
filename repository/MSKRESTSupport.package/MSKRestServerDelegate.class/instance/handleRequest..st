framework
handleRequest: request
	| call   |

	System gemConfigurationAt:#GemExceptionSignalCapturesStack put: true.

	(call := self swaggerMatch: request) 
		ifNil: [ ^ self noHandlerFound: request ].

	"stream := WriteStream on: String new.
	request writeOn: stream.
	MSKRestCallServerZMQ msklog: stream contents."

	^call execute