migration-support
autoCommitDuring: aBlock
  ^[ | commitThreshold |
    commitThreshold :=  75.
	GsFile msklog: 'AutoCommit'.
    [ 
      System signalAlmostOutOfMemoryThreshold: commitThreshold . 
      aBlock value
    ] onException: AlmostOutOfMemory do:[ :ex |
      System _commitPrintingDiagnostics ifFalse: [ 
			| aMSKRestCallOptions |
			aMSKRestCallOptions := MSKRestCallOptions currentInProcess.
			self error: 'AutoCommit not successful'.
		].
      System _vmMarkSweep.
      (System _tempObjSpacePercentUsedLastMark < commitThreshold) ifTrue: [
        "We dropped below the threshold reenable the signal"
        System enableAlmostOutOfMemoryError 
      ].
      ex resume  "continue execution" 
    ]
  ] ensure:[
    System signalAlmostOutOfMemoryThreshold: -1 "disable AlmostOOM signal"
  ].
