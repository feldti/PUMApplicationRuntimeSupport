form data support
checkFormData

	| aZnApplicationFormUrlEncodedEntity | 

	self request hasEntity 
		ifFalse:[	^nil ].

	(aZnApplicationFormUrlEncodedEntity := self request entity) isZnApplicationFormUrlEncodedEntity
		ifFalse:[ ^nil ].

	^aZnApplicationFormUrlEncodedEntity