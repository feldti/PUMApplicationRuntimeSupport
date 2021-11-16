*mskrestsupport
objectForOop: oopInteger  expectSubClass: aClass  ifFalse: zeroArgBlock

	| tmpObject |

	(oopInteger isInteger and:[ oopInteger > 0 ]) ifFalse:[ ^zeroArgBlock value ].
	(tmpObject := Object objectForOop:  oopInteger) isNil ifTrue:[ ^zeroArgBlock value ].
	(tmpObject class isSubclassOf: aClass) ifFalse:[ ^zeroArgBlock value ].

	^tmpObject