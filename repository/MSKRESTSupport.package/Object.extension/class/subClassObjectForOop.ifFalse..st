*mskrestsupport
subClassObjectForOop: oopInteger  ifFalse: zeroArgBlock

	| tmpObject |

	(oopInteger isInteger and:[ oopInteger > 0 ]) ifFalse:[ ^zeroArgBlock value ].
	(tmpObject := Object objectForOop:  oopInteger) isNil ifTrue:[ ^zeroArgBlock value ].
	(tmpObject class isSubclassOf: self  ) ifFalse:[ ^zeroArgBlock value ].

	^tmpObject