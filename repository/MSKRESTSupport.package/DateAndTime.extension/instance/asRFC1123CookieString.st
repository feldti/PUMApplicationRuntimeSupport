*MSKRESTSupport
asRFC1123CookieString
	"^a String
	c.f  >>asRFC1123StringOn: "

	| targetStream |
	targetStream := WriteStream on: String new.
	self asRFC1123CookieStringOn: targetStream.
	^targetStream contents