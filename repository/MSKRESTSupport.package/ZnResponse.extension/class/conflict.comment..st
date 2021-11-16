*MSKRESTSupport
conflict: request comment: aString
	^ self new
		statusLine: ZnStatusLine conflict;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: 'Conflict ' , aString );
		yourself