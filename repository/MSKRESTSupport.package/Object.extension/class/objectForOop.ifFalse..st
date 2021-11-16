*mskrestsupport
objectForOop: oopInteger  ifFalse: zeroArgBlock

	| tmpObject |

	(oopInteger isInteger and:[ oopInteger > 0 ]) ifFalse:[ ^zeroArgBlock value ].
	tmpObject := [ Object objectForOop:  oopInteger ] on: Exception do: [ :sig | sig return: nil ].
	tmpObject class ~= self ifTrue:[ ^zeroArgBlock value ].

	^tmpObject