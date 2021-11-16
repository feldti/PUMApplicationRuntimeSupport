error message support
error: numericErrorCode locale: localeString arguments: arguments

	| aMSKRESTErrCode expandedErrorText |

	aMSKRESTErrCode := self class errorLocaleDefinitionClass errorDefinition: numericErrorCode locale: localeString.
	expandedErrorText := aMSKRESTErrCode text expandMacrosWithArguments: arguments.

	^MSKRESTError 
		code: numericErrorCode
		text: expandedErrorText