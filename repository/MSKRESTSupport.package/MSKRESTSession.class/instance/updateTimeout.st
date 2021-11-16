Updating
updateTimeout

	lastActivity := DateAndTime now.
	expiration := self lastActivity + (Duration milliSeconds: self defaultTimeout)