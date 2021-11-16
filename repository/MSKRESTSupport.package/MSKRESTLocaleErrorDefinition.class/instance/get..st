Accessing
get: anInteger

	^self entries at: anInteger ifAbsent:[ MSKRESTErrCode code: 1 text: 'Unkown Description <',anInteger asString,'>' ]