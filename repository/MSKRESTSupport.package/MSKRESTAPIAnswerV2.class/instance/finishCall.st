action
finishCall
	
	addDebugInfo := SessionTemps current at: #gwcapidebug otherwise: true.

	resultModel isNil not ifTrue:[
		addDebugInfo  ifTrue:[
			resultModel
				setDbgss: System session ;
				setDbts: DateAndTime now asUTC.
			restCall isNil 
				ifTrue:[
					resultModel
						setDbgms: 0
				]
				ifFalse:[ 
					resultModel 
						setDbgms: (DateTime now asTime asMilliseconds truncated - restCall execution  asTime asMilliseconds truncated) abs ;
						setDbgapi: restCall apiSignature ;
						setDbgloc: restCall apiMethodSignature				
			].
		].
		resultModel
			setSuccess: success.
	].

	self createResponse.