services
addIndexSpec: aGsIndexSpec object: ownerObject container: containerObject

	| indexInfo |

	indexInfo := PUMIndexInfo new
						gsIndexSpec: aGsIndexSpec ;
						container: containerObject ;
						owner: ownerObject ;
						yourself.

	(registeredIndices at: ownerObject ifAbsentPut:[ OrderedCollection new ])
		add: indexInfo ;
		yourself
