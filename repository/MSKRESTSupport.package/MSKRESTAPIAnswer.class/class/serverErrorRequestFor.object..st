instance creation
serverErrorRequestFor: restCallInstance object: returnObject
	"^<GessCatiAPIAnswer> Eine Response wird erzeugt, um ein erfolgreiches get zu beschreiben - sollte also kein Commit erfordern"

	^self new initialize
			restCall: restCallInstance ;
			response: (self createResponse: ZnStatusLine internalServerError) ;
			data: returnObject ;
			failureCall ;
			noCommit ;
			yourself