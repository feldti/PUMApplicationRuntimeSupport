*MSK-ModelBaseRuntime
pumSortBy: aTwoArgSortBlock

	^(SortedCollection sortBlock: aTwoArgSortBlock)
			addAll: self ;
			yourself
