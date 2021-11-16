api-helpers
buildListAnswer: list apiListClass: aCATIAPIResultListClass totals: totalSize options: aMSKRestCallOptions

	^(self restAnswerClass 
		okRequestFor: aMSKRestCallOptions restCallInstance 
		result: ((aCATIAPIResultListClass with: list) setTotal: totalSize ; yourself))
			successWithCommitCall;
			yourself
