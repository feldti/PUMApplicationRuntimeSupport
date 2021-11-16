other
executeOneRequestResponseOn: stream
  "Execute one single HTTP request / response cycle on stream in 3 steps:
	#readRequest: #handleRequest: and #writeResponse:on:
	Indicate that we intend to close the connection afterwards"

 self halt