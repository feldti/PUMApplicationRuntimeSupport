execution
executeWithMeDuring: aBlock

	| p  result |
	
	p := Processor activeProcess.
	[
		p environmentAt: self class put: self.
		result := aBlock value.
	] ensure: [ 
		p environmentAt: self class put: nil 
	].

	^result.