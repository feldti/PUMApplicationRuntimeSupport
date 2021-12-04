testing
testGESSCati
	"
		MSKGeneralOpenAPICreator testGESSCati

	"

	| aMSKGeneralOpenAPICreator |

	aMSKGeneralOpenAPICreator := MSKGeneralOpenAPICreator new.

	"Zuerst legen wir die notwendigen Verzeicnisse ggfs. an. Der Ausspielungsort liegt unter /var/www/html/apis/...."
	aMSKGeneralOpenAPICreator
		aMSKRestCallV2: (MCPlatformSupport classNamed: #WCATIRestCall) ;
		baseDirectory: '/var/www/html' ;
		startDocumentCreation ;
		createDirectories;
		createRootDocument: (MSKOpenAPIJSONWriter toString: aMSKGeneralOpenAPICreator asOpenAPI) encodeAsUTF8intoString