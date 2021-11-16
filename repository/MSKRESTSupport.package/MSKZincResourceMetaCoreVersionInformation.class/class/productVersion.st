other
productVersion

	^self new initialize
		name: 'ZincResourceMetaCore' ;
		version: (PackageOrganizer default packageOfClass: ZnMimeType) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself