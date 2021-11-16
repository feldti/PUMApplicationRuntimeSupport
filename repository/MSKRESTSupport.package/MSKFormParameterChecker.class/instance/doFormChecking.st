checking
doFormChecking

	| pName rawValue   |

	pName := swaggerParameter name.

	(self option formUrlEncodedEntity includesField: pName) 
		ifFalse:[
			self swaggerParameter required ifTrue:[ 	^swaggerParameter missingBlock value: self ].
			^nil
		].

	rawValue := self option formUrlEncodedEntity at: pName. 

	^self doChecking: pName raw: rawValue