services
removeAllIndexes

	registeredIndices values do: [ :eachCollection |	
		eachCollection do: [ :eachPUMIndexInfo |
			eachPUMIndexInfo container removeAllIndexes ]].
	registeredIndices := Dictionary new.
