migration-support
migrateAllInstancesViaGsBitmapUsingFilename: aFilename classes: collectionOfClasses blockSize: numberOfMigrationsInTransaction clearHistory: clearClassHistory
	"^<Integer> Returns the number of the to be migrated object instnces	
		This method should migrate all persistent instances of classes (defined by collectionOfClasses) to their corresponding currentClass definition.
		This method is clearly a long running task in large databases. But it seems to be the fastest way to migrate object

	"
	| historicalClasses domainClassesWithHistories  bm  startIndex  limit arrayOfResults  largeBitmap  count |

	limit := 0.
	(GsFile existsOnServer: aFilename)
		ifTrue:[
			(GsFile removeServerFile: aFilename) isNil
				ifTrue:[ self error: 'Could not delete the temporary file <',aFilename asString,'>' ].
		].

	"Just in case we have changes in the current session, we abort the current transaction"
	System abortTransaction.
	GsFile gciLogServer: 'GsBitmap-Migration'.
	GsFile gciLogServer: ((ReadStream on: DateAndTime now asString) upTo: $.),' - Start instance migration'.
	GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - #Total Classes to consider: ' ,collectionOfClasses size asString.

	"From all the current classes we only need to consider the classes with a real class history"
	domainClassesWithHistories := collectionOfClasses select:[ :eachClass | eachClass  classHistory size > 1 ].
	GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - #Classes with history:' , domainClassesWithHistories size asString.

	"
	Now perhaps the stuff, which is not clear in the documentation. If you want to migrate instances you normally
	migrate them to the current class version. So you have to look for instances belonging to OLDER versions than
	current class version. In the next lines of code we look for all historical classes and add them to the classes to
	consider. The current class version is NOT in the result list.
	In all classes found we set the migration target class  and commit the result.
	"
	historicalClasses := Array new.
	domainClassesWithHistories do:[ :eachClass |
		(eachClass  classHistory copyFrom: 1 to: eachClass  classHistory size - 1)
			do: [ :singleClass |
				singleClass  migrateTo: singleClass currentVersion.
				historicalClasses add: singleClass
			]
	].	
	System commitTransaction.
	GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - #Classes (historical):' , historicalClasses size asString.

	historicalClasses notEmpty
		ifTrue:[
			largeBitmap := GsBitmap  new.
			GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - Start FindAllInstances - time consuming. Scans the extent'.
			"this will create heavy traffic on your machine"
			arrayOfResults  :=  SystemRepository  fastAllInstances:  historicalClasses.
			GsFile gciLogServer:   ((ReadStream on: DateAndTime now asString) upTo: $.),' - Finished FindAllInstances'.

			"For each class we get an instance of GsBitmap. We put them together in ONE large GsBitmap."
			arrayOfResults do: [ :eachSubArray |
				| aClass aGsBitmap |
				aClass := eachSubArray first.
				aGsBitmap := eachSubArray last.
				GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - #Instances found for class named: ', aClass name asString,' -> ',aGsBitmap size asString.
				aGsBitmap size > 0
					ifTrue: [
						largeBitmap := largeBitmap union: aGsBitmap.
					]
			].

			"We store them in the temporary file"
			count := largeBitmap  writeToFileInPageOrder: aFilename.
			GsFile gciLogServer: ((ReadStream on: DateAndTime now asString) upTo: $.),' - #OOPs written: ', count printString.

			limit  :=  largeBitmap  size.

			startIndex  :=  1.
			[ startIndex  <=  limit  ] whileTrue:  [
				bm  :=  GsBitmap  new.
				(bm  readFromFile:  aFilename withLimit:  numberOfMigrationsInTransaction  startingAt:  startIndex).
				bm  do:  [:ea  |  ea migrate ].  
				GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - Progress ',startIndex asString ,' of ', limit asString.
				startIndex  :=  startIndex  +  numberOfMigrationsInTransaction.
				System  commitTransaction  
					ifFalse:  [self  error:  'commit  failed'].
			].

			"class history should only be cleared, of no pending migration is available"
			(clearClassHistory and:[ limit = 0 ])
				ifTrue:[ 
					domainClassesWithHistories do: [ :eachClass | eachClass removeClassHistory ].
					System commitTransaction
						ifFalse:[ self error: 'Commit failed - Class History' ]
				]

		].
	GsFile gciLogServer:  ((ReadStream on: DateAndTime now asString) upTo: $.),' - Finished instance migration'.
	^limit
