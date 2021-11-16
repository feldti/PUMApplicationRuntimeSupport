api-helpers
buildListAnswer: list apiClass: aCATIAPIClass apiListClass: aCATIAPIResultListClass totals: totalSize options: aMSKRestCallOptions

	| tmpList |

	tmpList := list collect:[ :eachCATIClassInstance | aCATIAPIClass copyFrom: eachCATIClassInstance ].

	^(self restAnswerClass 
		okRequestFor: aMSKRestCallOptions restCallInstance 
		result: ((aCATIAPIResultListClass with: tmpList) 
						setTotal: totalSize ; 
						yourself))
			successWithCommitCall;
			yourself
