other
waitForConnectionFor: timeout on: aSocketStreamSocket ifTimedOut: timeoutBlock
	"Method has been put here to around a bug in the Gemstone Zinc package"
	"Wait up until the given deadline for a connection to be established."

	| aGsSocketOrNil |

	aGsSocketOrNil := aSocketStreamSocket underlyingSocket acceptTimeoutMs: timeout .
	aGsSocketOrNil isNil ifTrue:[^timeoutBlock value].
	^aGsSocketOrNil