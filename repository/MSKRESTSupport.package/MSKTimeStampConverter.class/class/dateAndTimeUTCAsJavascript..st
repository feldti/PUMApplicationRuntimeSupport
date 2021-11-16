support javascript
dateAndTimeUTCAsJavascript: aDateAndTime
	"^<Returns the current DateTime as UTC as a Javascript number"

	^(aDateAndTime asUTC asPosixSeconds * 1000) truncated