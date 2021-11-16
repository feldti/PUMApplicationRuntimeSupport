other
swaggerMatch: request
	self isAbstract ifTrue: [ ^ nil ].
	^ ZnRestServerUtils 
		swaggerMatchPath: request uri pathSegments 
		pattern: self pattern