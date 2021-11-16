*MSKRESTSupport
notImplementedComment: errorMessage
	^ self new
		statusLine: ZnStatusLine notImplemented;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: errorMessage);
		yourself