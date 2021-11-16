API-helpers
buildListAnswer: list apiListClass: apiResultListClass totals: totalSize options: aMSKRestCallOptions

	^(self restAnswerClass 
		okRequestFor: aMSKRestCallOptions restCallInstance 
		result: ((apiResultListClass with: list) setTotal: totalSize ; yourself))
			successWithCommitCall;
			yourself
