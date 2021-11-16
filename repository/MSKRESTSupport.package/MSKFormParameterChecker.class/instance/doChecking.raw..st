checking
doChecking: pName raw: rawValue
	| pValue |

	pValue := rawValue ifNotNil:[ rawValue ].

	((rawValue = 'undefined') or:[ rawValue isNil ]) ifTrue:[ 
		self swaggerParameter required ifTrue:[ ^swaggerParameter notValidBlock value: self value: pName value: rawValue  ].
		^nil ].

	swaggerParameter isIntegerType ifTrue:[ pValue := Integer readFrom: rawValue ifFail: [ nil ] ].
	swaggerParameter isBooleanType ifTrue:[ pValue := rawValue asLowercase = 'true' ].
	pValue isNil ifTrue:[ ^swaggerParameter notValidBlock value: self value: pName value: rawValue].

	swaggerParameter minimum notNil ifTrue:[ 
		(pValue < swaggerParameter minimum)
			ifTrue:[ ^swaggerParameter notValidBlock value: self value: pName value: rawValue ]
	].

	swaggerParameter maximum notNil ifTrue:[ 
		(pValue > swaggerParameter maximum)
			ifTrue:[ ^swaggerParameter notValidBlock value: self value: pName value: rawValue ]
	].

	swaggerParameter enum notNil 
		ifTrue:[ 
			(swaggerParameter validBlock notNil) 
				ifTrue:[
					(swaggerParameter enum includes: pValue) ifTrue:[ swaggerParameter validBlock value: self value: pName value: pValue. ^nil ].				
				].

			(swaggerParameter notValidBlock notNil)
				ifTrue:[
					(swaggerParameter enum includes: pValue) ifFalse:[ ^swaggerParameter notValidBlock value: self value: pName value: pValue ].				
				].
		].

	(swaggerParameter definedBlock notNil)
		ifTrue:[	swaggerParameter definedBlock value: self value: pName value: pValue. ^nil ].

	^nil