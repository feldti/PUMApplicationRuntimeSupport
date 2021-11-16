initialize
initialize

	super initialize.
	debugModeCallOnly := false.
	checkSession := true.
	publishedInAPI := false.
	obsoleteState := false.
	initialVersion := 'unkown'.
	examples := OrderedCollection new