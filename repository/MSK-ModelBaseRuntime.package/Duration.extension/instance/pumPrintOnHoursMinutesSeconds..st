*MSK-ModelBaseRuntime
pumPrintOnHoursMinutesSeconds: aStream

	self hours abs < 10 ifTrue: [aStream nextPut: $0].
	self hours abs printOn: aStream.
	aStream nextPut: $:.
	self minutes abs < 10 ifTrue: [aStream nextPut: $0].
	self minutes abs printOn: aStream.
	aStream nextPut: $:.
	self seconds abs < 10 ifTrue: [aStream nextPut: $0].
	self seconds truncated abs printOn: aStream.
