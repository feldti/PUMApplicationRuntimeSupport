other
productVersion

	^self new initialize
		name: 'ZincREST' ;
		version: (PackageOrganizer default packageOfClass: ZnJSONRestServerDelegate) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself