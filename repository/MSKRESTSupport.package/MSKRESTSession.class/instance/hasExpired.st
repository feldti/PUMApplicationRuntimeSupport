testing
hasExpired
	"^<Boolean> I return true, if the receiver has not been expired"

	^self hasExpiredAt: DateAndTime now