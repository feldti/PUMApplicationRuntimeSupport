instance creation
createdRequestFor: restCallInstance object: returnObject
	"^<GessCatiAPIAnswer> Ein Request ist fehlerhaft - daher kein Commit und kein Success"

	^self new initialize
			restCall: restCallInstance ;
			response: (self createResponse: ZnStatusLine created) ;
			data: returnObject ;
			successCall ;
			commit ;
			yourself