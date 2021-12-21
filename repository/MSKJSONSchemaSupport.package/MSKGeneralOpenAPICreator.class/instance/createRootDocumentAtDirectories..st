services
createRootDocumentAtDirectories: anArray
	| jsonString documentPath singleSchemaFile |

	self createDirectories: anArray.

	jsonString := (MSKOpenAPIJSONWriter toString: self asOpenAPI) encodeAsUTF8intoString.

	documentPath := self baseDirectory.
	anArray do: [ :each |
		documentPath := documentPath, '/', each
	].

	documentPath := documentPath,'/openapi.json'.

	singleSchemaFile := GsFile openWriteOnServer: documentPath.
	singleSchemaFile nextPutAll: jsonString.
	singleSchemaFile close.