private
createResponse: statusLine
	"^<ZnResponse> Eine Response wird erzeugt, um das erfolgreiche Anlegen einer Resource zu beschreiben"

	^(ZnResponse new)
			statusLine: statusLine;
			headers: ZnHeaders defaultResponseHeaders;	
			yourself.