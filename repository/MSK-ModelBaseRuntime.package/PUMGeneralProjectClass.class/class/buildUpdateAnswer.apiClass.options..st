api-helpers
buildUpdateAnswer: list apiClass: aCATIAPIClass options: aMSKRestCallOptions

	^self 
		buildCreateAnswer: (list collect:[ :eachCATIObject | aCATIAPIClass copyFrom: eachCATIObject]) 
		options: aMSKRestCallOptions
