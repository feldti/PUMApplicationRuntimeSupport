API-helpers
buildListAnswer: list apiClass: apiClass apiListClass: apiResultListClass totals: totalSize options: aMSKRestCallOptions

	| tmpList |

	tmpList := list collect:[ :eachCATIClassInstance | apiClass copyFrom: eachCATIClassInstance ].

	^(self restAnswerClass 
		okRequestFor: aMSKRestCallOptions restCallInstance 
		result: ((apiResultListClass with: tmpList) 
						setTotal: totalSize ; 
						yourself))
			successWithCommitCall;
			yourself
