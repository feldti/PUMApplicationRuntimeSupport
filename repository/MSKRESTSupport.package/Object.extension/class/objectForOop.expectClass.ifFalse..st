*mskrestsupport
objectForOop: oopInteger  expectClass: aClass  ifFalse: zeroArgBlock

	| tmpObject |

	(oopInteger isInteger and:[ oopInteger > 0 ]) ifFalse:[ ^zeroArgBlock value ].
	tmpObject := [ Object objectForOop:  oopInteger ] on: Exception do: [ :sig | sig return: nil ].
	tmpObject class ~= aClass ifTrue:[ ^zeroArgBlock value ].

	^tmpObject