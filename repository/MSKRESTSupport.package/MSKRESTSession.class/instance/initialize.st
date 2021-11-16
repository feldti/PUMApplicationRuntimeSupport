initialize
initialize

	__id := UUID new asString.
	defaultTimeout := self class defaultTimeoutInMilliseconds.
	self updateTimeout.

	userDefinedAttributes := Dictionary new.

	closed := false