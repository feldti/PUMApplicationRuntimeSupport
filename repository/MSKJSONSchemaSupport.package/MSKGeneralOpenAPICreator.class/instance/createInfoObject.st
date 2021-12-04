services
createInfoObject
	| aDictionary |

	aDictionary := Dictionary new.

	aDictionary
		at: 'title' put: self aMSKRestCallV2 projectClass projectCodeProjectTitle  ;
		at: 'description' put: self aMSKRestCallV2 projectClass projectDescription  ;
		at: 'termsOfService' put: self aMSKRestCallV2 projectClass projectTermsOfServiceURL  ;
		at: 'contact' put: self createContactObject ;
		at: 'license' put: self createLicenseObject ;
		at: 'version' put: self aMSKRestCallV2 projectClass projectVersion.


	^aDictionary