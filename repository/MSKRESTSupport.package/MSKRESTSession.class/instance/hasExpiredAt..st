testing
hasExpiredAt: aDateAndTime
	"^<Boolean> I return true, if the receiver has not been expired"

	^self expiration <= aDateAndTime