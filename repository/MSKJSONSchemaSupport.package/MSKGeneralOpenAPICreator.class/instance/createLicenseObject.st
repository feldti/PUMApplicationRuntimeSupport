services
createLicenseObject
	| aDictionary |

	aDictionary := Dictionary new.

	aDictionary
		at: 'name' put: self aMSKRestCallV2 projectClass projectLicenseName  ;
		at: 'url' put: self aMSKRestCallV2 projectClass projectLicenseURL .


	^aDictionary