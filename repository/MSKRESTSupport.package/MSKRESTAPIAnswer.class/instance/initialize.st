initialize
initialize

	doCommit :=  false.
	addDebugInfo := SessionTemps current at: #gwcapidebug otherwise: true.
	success := false.
	actionBlocks := OrderedCollection new.
	retriesAllowed := true.
	"default serialize message"
	jsonSerializeMessage := #neoJsonMapping: .
	doSessionUpdateInSameTransaction := true.
	zmqEvents := Array new.
	failureEventCalls := Array new.
	logEvents := Array new.

	allowedWithoutValidSession := false.