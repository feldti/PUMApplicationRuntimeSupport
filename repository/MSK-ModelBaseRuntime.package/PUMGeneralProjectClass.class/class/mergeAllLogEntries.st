log-entries-accessing
mergeAllLogEntries

	ObjectLogEntry objectQueue _addAll: self logEntries.
	self clearAllLogEntries
