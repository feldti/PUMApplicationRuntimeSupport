*MSK-ModelBaseRuntime
pumPrintOnHoursMinutesSeconds
	| stream |

	stream := WriteStream on: String new.
	self pumPrintOnHoursMinutesSeconds: stream.
	^stream contents
