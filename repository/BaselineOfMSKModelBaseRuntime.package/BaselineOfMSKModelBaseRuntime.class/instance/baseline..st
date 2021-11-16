other
baseline: spec 
	<baseline>

	"Now the actual delivered packages"
	spec
		package: 'MSK-ModelBaseRuntime';
		yourself.

	"Now the names for more specific loading"
	spec
		group: 'default' with: #('MSK-ModelBaseRuntime');
		yourself