migration-support
migrateAllInstancesViaGsBitmap

	| domainClassesToConsider migrationsPerTransactions migrator count |

	domainClassesToConsider := self classCreated select: [ :eachClass | eachClass isSubclassOf: self projectPersistentMasterClass ].
	domainClassesToConsider add: self.

	migrationsPerTransactions := 20000.

	count := 1.
	"Default-Work with ONE migrator task - me"
	[ count > 0 ] whileTrue:[
		migrator := MSKMigrater collector: nil classes: domainClassesToConsider fastMode: true.
		count := migrator createGsBitmapFile.

		migrator := MSKMigrater migrator: nil workerIndexOneBased: 1 workerTotal: 1 transactionStepSize: migrationsPerTransactions.
		migrator migrate
	]
