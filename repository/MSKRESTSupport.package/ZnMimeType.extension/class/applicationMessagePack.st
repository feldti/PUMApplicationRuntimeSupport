*MSKRESTSupport
applicationMessagePack

	^MimeTypes at: #applicationMsgPack ifAbsentPut:[ (self main: 'application' sub: 'x-msgpack') ]