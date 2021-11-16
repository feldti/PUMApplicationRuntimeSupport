*MSKRESTSupport
applicationJsonUTF8

	^MimeTypes at: #applicationJsonUTF8 ifAbsentPut:[ (self main: 'application' sub: 'json') setCharSetUTF8; yourself ]