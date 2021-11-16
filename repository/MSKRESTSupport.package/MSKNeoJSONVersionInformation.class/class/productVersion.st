other
productVersion

	^self new initialize
		name: 'NeoJSON' ;
		version: (PackageOrganizer default packageOfClass: NeoJSONMapper) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself