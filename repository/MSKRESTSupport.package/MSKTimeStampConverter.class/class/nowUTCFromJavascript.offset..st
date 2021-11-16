support javascript
nowUTCFromJavascript: anInteger offset: aDuration
	"^<DateAndTime> Returns an instance of DateAndTime in UTC"

	^DateAndTime posixSeconds: (anInteger asInteger / 1000) truncated offset: aDuration