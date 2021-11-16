Accessing
requesterHost

	| request |

	(request := self request) isNil  ifTrue:[ ^nil ].

	request headersDo: [ :headerKey :headerValue |	(headerKey = 'X-Forwarded-For') ifTrue:[ ^headerValue ] ].

	^nil