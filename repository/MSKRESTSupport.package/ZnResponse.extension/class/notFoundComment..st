*MSKRESTSupport
notFoundComment: errorMessage
	^ self new
		statusLine: ZnStatusLine notFound;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: errorMessage);
		yourself