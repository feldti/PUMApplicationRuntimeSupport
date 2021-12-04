additional attributes
required

	^(self properties values select: [ :each | each required ]) collect: [ :each2 | each2 name ]