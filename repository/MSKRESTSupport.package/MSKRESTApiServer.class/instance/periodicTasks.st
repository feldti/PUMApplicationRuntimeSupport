other
periodicTasks
	"Every #acceptWaitTimeout seconds this method is called.
	Note that during this time the server is not actively listening for connections."
	
	super periodicTasks.
	System inTransaction 
		ifFalse:[ System beginTransaction ].
	System abortTransaction.