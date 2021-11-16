other
productVersion

	^self new initialize
		name: 'MSKSwaggerSupport' ;
		version: (PackageOrganizer default packageOfClass: MSKSwaggerAPIDeclaration) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself