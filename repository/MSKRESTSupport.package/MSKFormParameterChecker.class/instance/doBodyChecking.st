checking
doBodyChecking

	| pName rawValue request  aZnMultiPartFormDataEntity aZnMimePart |

	pName := swaggerParameter name.
	request := option restCallInstance request.

	request hasEntity ifFalse:[
		^MSKRESTAPIAnswer 
			badRequestFor: option restCallInstance 
			object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeNoEntity)].

	(aZnMultiPartFormDataEntity := request entity) isZnMultiPartFormDataEntity 
		ifTrue:[
			aZnMultiPartFormDataEntity isEmpty ifTrue:[
				^MSKRESTAPIAnswer 
					badRequestFor: option restCallInstance 
					object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeEmptyMultiPartFormDataEntity )].

			(aZnMimePart := aZnMultiPartFormDataEntity partNamed: pName ifNone:[ nil ]) isNil ifTrue:[
				^MSKRESTAPIAnswer 
					badRequestFor: option restCallInstance 
					object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeMimePartNotFound arguments: (Array with: pName ))].
			rawValue := aZnMimePart .
			^self doChecking: pName raw: rawValue


		]
		ifFalse:[ 
			| targetClass entry |

			aZnMultiPartFormDataEntity isEmpty ifTrue:[
				^MSKRESTAPIAnswer 
					badRequestFor: option restCallInstance 
					object: (option restCallInstance  error: CATIEnumErrorCodes errCodeEmptyMultiPartFormDataEntity )].		

			(aZnMultiPartFormDataEntity contentType mskIsJSONType 
				or:[ aZnMultiPartFormDataEntity contentType mskIsPlainTextType ])
				ifTrue:[

					(entry := System myUserProfile resolveSymbol: swaggerParameter dataType asSymbol) notNil 
						ifTrue:[ 
							| contents |
							contents := aZnMultiPartFormDataEntity contents.
							targetClass := entry value.
							rawValue := (NeoJSONReader on: contents readStream) propertyNamesAsSymbols: true ; nextAs: targetClass.
							^self doChecking: pName raw: rawValue
						]
						ifFalse:[
							^MSKRESTAPIAnswer 
								badRequestFor: option restCallInstance 
								object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeMimePartNotFound arguments: (Array with: swaggerParameter dataType ))
						]
				]
				ifFalse:[
							^MSKRESTAPIAnswer 
								badRequestFor: option restCallInstance 
								object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeMimePartNotFound arguments: (Array with: 'no json part' ))

				]

		].

		^MSKRESTAPIAnswer 
			badRequestFor: option restCallInstance 
			object: (option restCallInstance  error: MSKRESTBaseErrorCodes errCodeNoMultiPartFormDataEntity )