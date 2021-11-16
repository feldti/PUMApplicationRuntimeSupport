json support
productVersion

	^self new initialize
		name: 'MSKRESTSupport' ;
		version: (PackageOrganizer default packageOfClass: MSKSoftwareVersionInformation) versionString ;
		protocol: '1.0' ;
		enabled: true ;
		yourself