log messages
errorMessage: aString
		"Method comment"

	self messages add: ((ObjectLogEntry error: self messageLabel object: aString)
									tag: self tag ;
									yourself)