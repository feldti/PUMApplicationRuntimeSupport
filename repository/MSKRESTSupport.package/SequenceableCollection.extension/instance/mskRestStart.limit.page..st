*MSKRESTSupport
mskRestStart: startValue limit: limitValue page: pageValue

	| startIndex endIndex |

	self isEmpty ifTrue:[ ^self ].

	startValue isInteger
		ifTrue:[
			startIndex := (startValue + 1 ) > self size ifTrue:[ self size ] ifFalse:[ startValue + 1 ].
			limitValue = -1
				ifTrue:[ endIndex := self size ]
				ifFalse:[	endIndex := (startIndex +  limitValue) > self size ifTrue:[  self size ] ifFalse:[ startIndex + limitValue - 1 ]]
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
									ifFalse:[ pageValue * itemsPerPage + 1 ].

			endIndex := (startIndex +  itemsPerPage) > self size 
									ifTrue:[  self size ] 
									ifFalse:[ startIndex +  itemsPerPage - 1 ]
		].

	^self copyFrom: startIndex to: endIndex