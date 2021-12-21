services
createDirectories: anArrayOfSubDirectories

	| newDirectory tmp |

	newDirectory := self baseDirectory.
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'base directory ',self baseDirectory,' not available' ].

	anArrayOfSubDirectories do: [ :each |
		newDirectory := newDirectory,'/', each.
		(tmp := GsFile isServerDirectory: newDirectory) isNil 
			ifTrue: [ GsFile createServerDirectory: newDirectory mode: 8r777 ].
		(GsFile isServerDirectory: newDirectory) 
			ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT be created' ].
	].