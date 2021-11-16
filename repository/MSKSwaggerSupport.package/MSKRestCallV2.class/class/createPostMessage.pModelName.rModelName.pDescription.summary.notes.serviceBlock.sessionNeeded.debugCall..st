swagger helpers
createPostMessage: nickname pModelName: parameterModelName rModelName: returnModelName pDescription: pDescriptionText summary: summaryText notes: notesText serviceBlock: threeArgBlock sessionNeeded: sessionFlag debugCall: debugFlag

	| operation |

	operation := MSKExtSwaggerOperation new initialize.
	operation
			method: 'POST' ;
			nickname: nickname asUnicodeString ;
			type: parameterModelName asUnicodeString ;
			debugModeCallOnly: debugFlag ;
			checkSession: sessionFlag ;
			notes: (notesText ifNotNil: [ notesText asUnicodeString]) ;
			summary: (summaryText isNil ifTrue: [ summaryText  ] ifFalse: [ summaryText asUnicodeString]).

	(parameterModelName isNil or:[ parameterModelName isEmpty ]) ifFalse:[
				operation
					addParameter: (MSKSwaggerParameterDescription new initialize
											paramType: MSKSwaggerConstants parameterBodyLocated ;
											name: 'MessageParameter' ; 
											description: pDescriptionText asUnicodeString ;
											beRequired ;
											dataType: parameterModelName  ;	
											missingBlock: self defaultParameterMissingBlock ;
											definedBlock: self defaultParameterDefinedBlock ;
											yourself)
			].

	operation
			addResponse: ((MSKSwaggerResponseMessage new initialize) 
										code: 200 ; 
										reason: 'The call always returns HTTP code 200. To check the success of the operation please check the returned structure' asUnicodeString; 
										responseModel: returnModelName ;
										yourself) ;

			serviceCall: threeArgBlock.

	

	^operation