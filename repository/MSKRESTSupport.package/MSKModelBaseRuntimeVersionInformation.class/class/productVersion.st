other
productVersion

	^self new initialize
		name: 'NeoJSON' ;
		version: (PackageOrganizer default packageOfClass: PUMGeneralDomainObject) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself