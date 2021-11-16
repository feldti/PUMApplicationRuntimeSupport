other
handleRequestProtected: request
  "Handle request and return a response.
	If a Smalltalk Error is thrown, return a HTTP Server Error response."

	^self delegate
		ifNil: [ ZnResponse notFound: request uri ]
		ifNotNil: [ :delegate | delegate handleRequest: request ]