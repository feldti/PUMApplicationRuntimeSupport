other
baseline: spec 
	<baseline>
	spec
		for: #'gemstone'
		do: [
			"First the prerequisites"
			spec
				baseline: 'ZincHTTPComponents'	
				with: [ 
					spec
						loads: #('REST');
						repository: 'github://GsDevKit/zinc:gs_master/repository' ];
				yourself.

			"Now the actual delivered packages"
			spec
				package: 'MSKSwaggerSupport' with: [ spec requires: #('ZincHTTPComponents-REST' ) ] ;
				yourself.

			"Now the names for more specific loading"
			spec
				group: 'default' with: #('MSKSwaggerSupport');
				yourself
		]
