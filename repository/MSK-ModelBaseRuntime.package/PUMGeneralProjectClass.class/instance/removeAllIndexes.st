services
removeAllIndexes
	"Removes all registered indices"

	projectIndexManager isNil ifFalse:[ projectIndexManager removeAllIndexes ]
