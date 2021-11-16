*MSKRESTSupport
conflict: request
	^ self new
		statusLine: ZnStatusLine conflict;
		headers: ZnHeaders defaultResponseHeaders;
		yourself