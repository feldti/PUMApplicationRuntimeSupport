migration-support
migrateAllInstances: domainClassesToConsider

	| withError allCounter classSpecificCounter  progressCounter |


	withError := false.
	allCounter := 0.
	classSpecificCounter := 0.
	progressCounter := 0.
	

	System abort. 
	GsFile msklog: 'Migration to: ' , self projectVersion asString, '. Start migrating at: ', DateAndTime now printString.

	domainClassesToConsider do: [ :eachClass | | history allObjects arrays totalCount  |
		progressCounter :=  progressCounter + 1.
		GsFile msklog: 'Consider migrating ...(' , progressCounter asString , '/', domainClassesToConsider size asString,') - ',eachClass name asString.
		(history := eachClass  classHistory) size > 1 ifTrue:[ 
			GsFile msklog: 'History size of class : ' , history size asString.
			System abort. 
			GsFile msklog: 'Searching for instances.'.
			allObjects := SystemRepository listInstances: history.

			totalCount := 0.
			1 to: (history size -1) do: [ :anIndex | totalCount := totalCount +  (allObjects at: anIndex) size ].
			GsFile msklog: 'Number of instances for class : ' , totalCount asString.

			classSpecificCounter := 0.
			1 to: (history size -1) do: [ :anIndex | 
				allCounter := allCounter + (allObjects at: anIndex) size.
				classSpecificCounter := classSpecificCounter + (allObjects at: anIndex) size.

				GsFile msklog: 'Migrating: ' ,(history at: anIndex) name asString,' from ' ,(history at: anIndex) projectVersion, ' to: ', eachClass currentVersion projectVersion,' # ',classSpecificCounter asString.

				self autoCommitDuring: [ 
					arrays := (history at: anIndex) migrateInstances: (allObjects at: anIndex) to:  eachClass currentVersion.

				].
				(arrays at: 3) isEmpty ifFalse: [ self halt. GsFile mskerror:  '*** Migrating ...' , eachClass name asString ,  ' Some instances are not converted (3): ' , (arrays at: 3) size asString. withError := true. ].
				(arrays at: 4) isEmpty ifFalse: [ self halt. GsFile mskerror:  '*** Migrating ...' , eachClass name asString ,  ' Some instances are not converted (4) : ' , (arrays at: 4) size printString. withError := false. ].

				System commit. 
				GsFile msklog: 'Migrating ...' , eachClass name asString , ' - Finished at: ' , DateAndTime now printString.
			].
			withError ifFalse:[
				eachClass removeClassHistory.
				System commit. 
			]
		].
	].
	withError 
		ifFalse:[ 
			GsFile msklog: 'Class history cleaning - Starting at:  ', DateAndTime now printString.
			"GsDeployer cleanClassHistory."
			GsFile msklog: 'Class history cleaning - Finished at:  ', DateAndTime now printString.
		].
	System commit.
	GsFile msklog: 'Summary of Migration stopped at: ', DateAndTime now printString.
	GsFile msklog: 'Total Number of instances migrated ' , allCounter printString.
