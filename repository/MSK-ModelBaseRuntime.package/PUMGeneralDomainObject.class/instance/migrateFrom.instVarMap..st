migration-support
migrateFrom: _oldValue instVarMap: _unusedParameter

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
	self manualMigrateFrom: _oldValue instVarMap: _unusedParameter
