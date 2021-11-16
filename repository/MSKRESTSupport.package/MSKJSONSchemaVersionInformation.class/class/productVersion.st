other
productVersion

	^self new initialize
		name: 'MSKJSONSchemaSupport' ;
		version: (PackageOrganizer default packageOfClass: MSKJSONGeneralType) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself