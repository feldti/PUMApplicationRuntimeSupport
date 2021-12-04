services
createContactObject
	| aDictionary |

	aDictionary := Dictionary new.

	aDictionary
		at: 'name' put: self aMSKRestCallV2 projectClass projectContactName  ;
		at: 'url' put: self aMSKRestCallV2 projectClass projectContactURL  ;
		at: 'email' put: self aMSKRestCallV2 projectClass projectContactEMail .


	^aDictionary