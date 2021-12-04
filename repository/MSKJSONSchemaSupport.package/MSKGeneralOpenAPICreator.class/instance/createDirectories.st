services
createDirectories

	| newDirectory tmp |

	newDirectory := self baseDirectory.
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'base directory ',self baseDirectory,' not available' ].

	newDirectory := newDirectory,'/apis'.
	(tmp := GsFile isServerDirectory: newDirectory) isNil 
		ifTrue: [ GsFile createServerDirectory: newDirectory mode: 8r777 ].
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT be created' ].

	newDirectory := newDirectory,'/webcati'.
	(tmp := GsFile isServerDirectory: newDirectory) isNil 
		ifTrue:[ GsFile createServerDirectory: newDirectory mode: 8r777 ].
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT be created' ].

	newDirectory := newDirectory,'/',self aMSKRestCallV2 versionPartOfPath.
	(tmp := GsFile isServerDirectory: newDirectory) isNil 
		ifTrue:[ GsFile createServerDirectory: newDirectory mode: 8r777 ].
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT be created' ].

	newDirectory := newDirectory,'/components'.
	(tmp := GsFile isServerDirectory: newDirectory) isNil 
		ifTrue:[ GsFile createServerDirectory: newDirectory mode: 8r777 ].
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT becreated' ].

	newDirectory := newDirectory,'/schemas'.
	(tmp := GsFile isServerDirectory: newDirectory) isNil 
		ifTrue:[ GsFile createServerDirectory: newDirectory mode: 8r777 ].
	(GsFile isServerDirectory: newDirectory) 
		ifFalse:[ self halt: 'directory ',self baseDirectory,' could NOT be  created' ].