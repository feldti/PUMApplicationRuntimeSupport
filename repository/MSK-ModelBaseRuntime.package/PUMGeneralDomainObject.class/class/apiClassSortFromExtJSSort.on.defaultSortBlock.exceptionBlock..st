gsquerysupport
apiClassSortFromExtJSSort: sortString on: knownItems defaultSortBlock: aTwoArgBlockOrNil exceptionBlock: aOneArgBlock
	"Method to build a Sorteollection based on a ExtJS Sort String"


	|  sortingDescription blockSourceStream firstDescription propertyAccessor propertyName direction |

	(sortString == UndefinedObject or:[ sortString isEmptyOrNil ]) 
		ifTrue:[ 
			| result |

			result := aTwoArgBlockOrNil isNil
								ifTrue:[ knownItems ]
								ifFalse:[ knownItems pumSortBy: aTwoArgBlockOrNil ].
			^result isSequenceable ifTrue:[ result ] ifFalse:[ result asArray ]
		].

	sortingDescription := NeoJSONReader fromString: sortString.
	firstDescription := sortingDescription first.
	direction := firstDescription at: 'direction' ifAbsent:[  'ASC' ].
	propertyName :=  firstDescription at: 'property' ifAbsent:[ ^aTwoArgBlockOrNil isNil ifTrue:[ Array new ] ifFalse:[ ^knownItems pumSortBy: aTwoArgBlockOrNil ] ].
	(propertyAccessor := self getDomainPropertyAccessor: propertyName) isNil ifTrue:[  ^knownItems pumSortBy: aTwoArgBlockOrNil ]. 
	blockSourceStream := WriteStream on: String new.
	blockSourceStream nextPutAll: '[ :a :b |' ;  nextPutAll: ' a  '; nextPutAll: propertyAccessor ; nextPutAll: ((direction = 'ASC') ifTrue:[ ' pumIsSmallerThan: ' ] ifFalse:[ ' pumIsLargerThan: ' ]) ; nextPutAll: ' b ' ; nextPutAll: propertyAccessor ;  nextPutAll: ' ]'.  
	^knownItems pumSortBy: blockSourceStream contents evaluate.
