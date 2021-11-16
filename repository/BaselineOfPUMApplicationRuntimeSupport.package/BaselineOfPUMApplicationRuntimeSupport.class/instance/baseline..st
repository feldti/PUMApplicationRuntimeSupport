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

			spec
				baseline: 'GsZMQ'	
				with: [ 
					spec
						loads: #('default');
						repository: 'github://feldti/GsZMQ:main/repository' ];
				yourself.

			"Now the actual delivered packages"
			spec
				package: 'MSKRESTSupport'  with: [ spec requires: #('ZincHTTPComponents' 'GsZMQ') ] ;
				package: 'MSKSwaggerSupport' with: [ spec requires: #('ZincHTTPComponents' ) ] ;
				package: 'MSKJSONSchemaSupport';
				package: 'MSK-ModelBaseRuntime';
				yourself.

			"Now the names for more specific loading"
			spec
				group: 'default' with: #('MSKRESTSupport' 'MSKSwaggerSupport' 'MSKJSONSchemaSupport'  'MSK-ModelBaseRuntime');
				yourself
		]
