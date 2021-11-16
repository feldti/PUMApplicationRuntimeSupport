*MSKRESTSupport
mskReverseRestStart: startValue limit: limitValue	page: pageValue

	| startIndex endIndex result |

	self isEmpty ifTrue:[ ^self ].

	startValue isInteger
		ifTrue:[
			startIndex := (startValue + 1 ) > self size ifTrue:[ 1 ] ifFalse:[ self size - startValue ].
			endIndex := 
				limitValue = -1
					ifTrue:[ 	 1 ]
					ifFalse:[ (startIndex -  limitValue) < 1 ifTrue:[  1 ] ifFalse:[ startIndex - limitValue  ]]
		]
		ifFalse:[
			| itemsPerPage |
			itemsPerPage := limitValue < 0  
											ifTrue:[ self size ] 
											ifFalse:[ 
												(limitValue > 0)
													ifTrue:[ limitValue]
													ifFalse:[ 0]
											].

			startIndex := (pageValue * itemsPerPage + 1)  > self size 
									ifTrue:[ self size ] 
									ifFalse:[ self size - (pageValue * itemsPerPage) - 1 ].

			endIndex := (startIndex +  itemsPerPage) > self size 
									ifTrue:[  1 ] 
									ifFalse:[ self size - startIndex +  itemsPerPage - 1 ]
		].

	result := Array new.
	startIndex  to: endIndex by: -1 do: [ :anIndex |
		result add: (self at: anIndex)

	].

	^result