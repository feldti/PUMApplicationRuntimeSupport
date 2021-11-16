request support
swaggerMatch: request

	"Wird die globale Resource-URL abgefragt ?"
	self resourceURL isNil ifFalse:[


	].

	"Wird eine der einzelnen API-Specs abgefragt ?"
	self apiSpecs detect:[ :eachAPISpec | eachAPISpec swaggerMatch: request ].

	"Und nun die einzelnen Befehle ...."