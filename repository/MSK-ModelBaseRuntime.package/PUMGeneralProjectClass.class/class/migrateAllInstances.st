migration-support
migrateAllInstances

	| withError allCounter classSpecificCounter domainClassesToConsider progressCounter |


	withError := false.
	allCounter := 0.
	classSpecificCounter := 0.
	progressCounter := 0.
	

	System abort. 
	GsFile msklog: 'Migration to: ' , self projectVersion asString, '. Start migrating at: ', DateAndTime now printString.

	domainClassesToConsider := self classCreated select: [ :eachClass | eachClass isSubclassOf: self projectPersistentMasterClass ].

	self migrateAllInstances: domainClassesToConsider.

	"Die Projektdatei sollte auch migriert werden"
	self migrateAllInstances: (Array with: self)
