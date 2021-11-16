framework
swaggerMatch: request
	| call |

	(call := uriSpace swaggerMatch: request)
		ifNotNil: [
			call
				request: request; 
				delegate: self ].
	^ call