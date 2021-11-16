constants
createUSErrorCodes: aMSKRESTLocaleErrorDefinition

	^aMSKRESTLocaleErrorDefinition
		"codes 1 .. 99"
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeParameterMissing "CATIEnumErrorCodes errCodeParameterMissing" text: 'Parameter "<1s>" missing') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeParameterWrongValue "CATIEnumErrorCodes errCodeParameterWrongValue" text: 'Parameter "<1s>" has wrong value "<2s>"') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeNoParameterOrNoFormElements "CATIEnumErrorCodes errCodeNoParameterOrNoFormElements" text: 'No Parameter transmitted or NOT application/x-www-form-urlencoded') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeNoDebugMode "CATIEnumErrorCodes errCodeNoDebugMode" text: 'Server NOT running in DEBUG MODE') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeWrongActingUserSession "CATIEnumErrorCodes errCodeWrongActingUserSession" text: 'Unknown acting user id') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeWrongUserSession "CATIEnumErrorCodes errCodeWrongUserSession" text: 'User Session not found "<1s>"') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeWrongVerification "CATIEnumErrorCodes errCodeWrongVerification" text: 'User Validation failed') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeNoEntity "CATIEnumErrorCodes errCodeNoEntity" text: 'UserRequest has no entry') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeNoFormURLEncodingEntity "CATIEnumErrorCodes errCodeNoFormURLEncodingEntity" text: 'UserRequest has no form URL encoding entry') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeNoMultiPartFormDataEntity "CATIEnumErrorCodes errCodeNoMultiPartFormDataEntity" text: 'No Multipart entity found') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeEmptyMultiPartFormDataEntity "CATIEnumErrorCodes errCodeEmptyMultiPartFormDataEntity" text: 'Empty MultiPart entity found') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeMimePartNotFound "CATIEnumErrorCodes errCodeMimePartNotFound" text: 'MimePart named "<1s>" in MultiPart not found') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeRevisionConflict "CATIEnumErrorCodes errCodeRevisionConflict" text: 'Revision conflicht found') ;
		add: (MSKRESTErrCode code: MSKRESTBaseErrorCodes errCodeMethodNotImplemented"CATIEnumErrorCodes errCodeMethodNotImplemented" text: 'Method not implemented "<1s>"') ;
		yourself