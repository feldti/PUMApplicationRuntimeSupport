log messages
logMessage: aString
		"Method comment"

	self messages add: ((ObjectLogEntry transcript: self messageLabel object: aString) tag: self tag ; yourself)