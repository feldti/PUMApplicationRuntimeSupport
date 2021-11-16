API-helpers
buildUpdateAnswer: list apiClass: apiClass options: aMSKRestCallOptions

	^self 
		buildCreateAnswer: (list collect:[ :eachCATIObject | apiClass copyFrom: eachCATIObject]) 
		options: aMSKRestCallOptions
