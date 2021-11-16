other
productVersion

	^self new initialize
		name: 'ZincHTTP' ;
		version: (PackageOrganizer default packageOfClass: ZnClient) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself