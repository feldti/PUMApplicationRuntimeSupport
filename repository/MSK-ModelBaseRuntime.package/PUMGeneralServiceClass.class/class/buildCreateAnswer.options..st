API-helpers
buildCreateAnswer: list options: aMSKRestCallOptions

	^(self restAnswerClass 
		okRequestFor: aMSKRestCallOptions restCallInstance 
		result: ((CATIAPIObjectWithIDsResultList with: list) setTotal: list size ; yourself))
			successWithCommitCall;
			yourself
