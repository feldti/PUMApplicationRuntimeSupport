instance creation
newDefaultServer
	"
	| aServer |
	
	aServer := MSKRestCallServer newDefaultServer.
	aServer startServer: true httpDebug: true localhost: true
	"

	| newServer |

	newServer := self newServer.

	Default notNil ifTrue:[ "Default stop." Default := nil ].

	^Default := newServer.