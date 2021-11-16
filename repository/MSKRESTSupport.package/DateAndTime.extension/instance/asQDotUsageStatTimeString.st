*MSKRESTSupport
asQDotUsageStatTimeString
	"^a String
	c.f  >>asRFC1123StringOn: "

	| targetStream |
	targetStream := WriteStream on: String new.
	self asQDotUsageStatTimeStringOn: targetStream.
	^targetStream contents