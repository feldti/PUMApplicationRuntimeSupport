API-helpers
buildListAnswer: list apiListClass: apiResultListClass totals: totalSize options: aMSKRestCallOptions commit: commitFlag

	| answer |

	answer := 
		(self restAnswerClass 
			okRequestFor: aMSKRestCallOptions restCallInstance 
			result: ((apiResultListClass with: list) setTotal: totalSize ; yourself))

			yourself.

	commitFlag 
		ifTrue:[	answer successWithCommitCall ] 
		ifFalse:[ answer successWithoutCommitCall ].

	^answer
