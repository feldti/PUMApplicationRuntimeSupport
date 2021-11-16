support javascript
nowUTCFromJavascript: anInteger
	"^<DateAndTime> Returns an instance of DateAndTime in UTC"

	^self nowUTCFromJavascript: anInteger offset: (Duration zero)