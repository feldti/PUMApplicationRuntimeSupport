Accessing
getCurrentLocale

	^self localeString ifNil:[ self session isNil ifTrue:[ nil ] ifFalse:[ self session getCurrentLocale ]]