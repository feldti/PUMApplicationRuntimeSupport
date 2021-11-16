*MSK-ModelBaseRuntime
pumFindObjectViaGop: gopValue errorText: errorString options: aMSKRestCallOptions
	"^<Object> Searches an object via its gop and expects an instance of a specific class - throws exceptions if error occurs"

	gopValue pumIsValidOOPNumber
		ifTrue:[
			^self 
					objectForOop:gopValue
					ifFalse: [  CATIEnumErrorCodesLocaleErrorDefinition errCodeGeneralErrorThrowSignal: aMSKRestCallOptions  with1Args: (Array with:errorString) ]. 
		]
		ifFalse:[
			CATIEnumErrorCodesLocaleErrorDefinition errCodeGeneralErrorThrowSignal: aMSKRestCallOptions  with1Args: (Array with: errorString) 
		].
