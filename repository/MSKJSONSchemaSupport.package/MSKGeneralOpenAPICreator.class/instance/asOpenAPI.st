services
asOpenAPI
	"^<Dictionary> Gibt ein Dictionary zurück, dass in den JSON Converter gegeben werden kann, um eine OpenAPI 3.0.x Spezifikation zu speichern"

	| aDictionary componentsObject|

	aDictionary := Dictionary new.

	aDictionary
		at: 'openapi' put: '3.0.0' ;
		at: 'info' put: self createInfoObject ;
		at: 'servers' put: self createServersObject ;
		at: 'paths' put: self createPathsObject ;
		at: 'components' put: (componentsObject := self createComponentsObject) ;
		at: 'security' put: self createSecurityObject ;	
		at: 'tags' put: self createTagsObject ;
		at: self class propertyNameModellingTool put: 'PUM-Modeller 10.01' ;
		at: self class propertyNameCodeGenerator put: 'Topaz/Gemstone Smalltalk 10.01';
		at: self class propertyNameCodeCreationTS put: self documentCreationTS asRFC3339String.

	self createSchemas: componentsObject.

	^aDictionary