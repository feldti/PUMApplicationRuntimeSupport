instance creation
okRequestFor: restCallInstance object: returnObject
	"^<GessCatiAPIAnswer> Eine Response wird erzeugt, um ein erfolgreiches get zu beschreiben - sollte also kein Commit erfordern"

	^self new initialize
			restCall: restCallInstance ;
			response: (self createResponse: ZnStatusLine ok) ;
			data: returnObject ;
			successCall ;
			noCommit ;
			yourself