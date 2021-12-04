services
createRootDocument: aString

	|  schemaDirectory singleSchemaFile |

	schemaDirectory := self baseDirectory,'/apis/webcati/',self aMSKRestCallV2 versionPartOfPath,'/openapi.json'.

	singleSchemaFile := GsFile openWriteOnServer: schemaDirectory.
	singleSchemaFile nextPutAll: aString.
	singleSchemaFile close.