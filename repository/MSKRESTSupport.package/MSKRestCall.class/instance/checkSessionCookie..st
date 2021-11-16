session support
checkSessionCookie: aMSKCallOptions
	"^<ZnCookie | MSKRESTSessionNotFound > If the cookie can not be found -> it throws an exception"

	|  sessionKeyValue  |

	"Zuerst den Session Wert über den Request abfragen"
	sessionKeyValue :=  self request uri queryAt: 'sessionID'  ifAbsent:[ nil ].

	"Wenn kein entsprechender Parameter gefunden wurde, dann Meldung ausgeben und über den Cookie probieren"
	sessionKeyValue isNil
		ifTrue:[ 
			GsFile gciLogServer: 'Parameter <sessionID> NOT found at URL <',( self request uri asString),'>'.
			GsFile gciLogServer: 'Session ID found via cookie  and NOT via URL <',( self request uri asString),'>' .
			^MSKRESTSessionNotFound new restCall: self ; 	signal
		].

	(session := self restServiceClass searchSessionViaID: sessionKeyValue) ifNil: [ 	GsFile gciLogServer: 'Session not found <',( self request uri asString),'>'. ^MSKRESTSessionNotFound new restCall: self ; 	signal	].

	session hasExpired
		ifTrue:[ 
			GsFile gciLogServer: 'Session Expired <',( self request uri asString),'>'.
			^MSKRESTSessionNotFound new restCall: self ; 	signal ]