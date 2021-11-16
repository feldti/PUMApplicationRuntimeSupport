other
acceptWaitTimeout
	"^<Integer>
		How many seconds to wait for a server socket listening for an accept. According to a posting of Paul Baumann
		it is useful for Gemstone that their views start from the same database view.
	"

		| millisecondsNow wishedIntervallInMilliseconds newIntervallInMS |

		wishedIntervallInMilliseconds := self defaultTimeoutInMilliseconds.
		millisecondsNow := Time millisecondClockValue.

		"calculating the milliseconds to the next wished point"
		newIntervallInMS := millisecondsNow // wishedIntervallInMilliseconds * wishedIntervallInMilliseconds + wishedIntervallInMilliseconds - millisecondsNow.

		"if the time is too short - take the next wished point after that"
		^newIntervallInMS <  self minimumTimeoutInMilliseconds
			ifTrue:[ newIntervallInMS + wishedIntervallInMilliseconds ]
			ifFalse:[ newIntervallInMS ]