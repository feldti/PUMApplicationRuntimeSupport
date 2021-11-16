Accessing
copyForTemplate

	^self class new initialize
		defaultSource: self defaultSource ;
		currentSource: self currentSource ;
		compiledMethod: self compiledMethod ;
	    domainObject: nil ;
		compiledTS: self compiledTS ;
		sourceType: self sourceType ;
		compiledDefaultMethod: self compiledDefaultMethod ;
	    defaultName: self defaultName ;
		currentName: self currentName ;
		defaultDescription: self defaultDescription ;
		currentDescription: self currentDescription ;
		yourself
