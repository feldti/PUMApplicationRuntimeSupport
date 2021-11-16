*MSKRESTSupport
asRFC3339SpecialString
	"Gibt den Zeitwert als String zurück, aber die Millisekunden werden nur auf 3 Stellen reduziert - Python mag nicht mehr als 5 Stellen
		DateAndTime now asRFC3339SpecialString
	"

	| x anArray aStream|

	aStream := WriteStream on: String new.
	anArray := self asFloatParts.
	x := anArray at: 1.
	x < 0 ifTrue: [aStream nextPut: $-].
	(x := x abs) < 1000 ifTrue: [aStream nextPut: $0].
	x < 100 ifTrue: [aStream nextPut: $0].
	x < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $-.
	(x := anArray at: 3) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $-.
	(x := anArray at: 4) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $T.
	(x := anArray at: 5) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $:.
	(x := anArray at: 6) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $:.

	"Anzahl der Sekunden mit Bruchteil"
	x := anArray at: 7.
	"Keine Bruchteile an Sekunden ?"
	x \\ 1 = 0
		ifTrue: [ 
			"Weniger als 10 Sekunden -> dann fehlt die 10er Digit"
			x < 10 ifTrue: [ aStream nextPut: $0 ].
			x rounded printOn: aStream.
			aStream nextPutAll: '.000'.
		]
		ifFalse: [ 
			| length formatedString  |
			length := 6.
			"x is either a ScaledDecimal or a Float"
			x asInteger < 10 ifTrue: [ aStream nextPut: $0. length := 5. ].
			formatedString := (((x * 1000) truncated / 1000) asFloat asStringLocaleC ).
			formatedString size ~= length
				ifTrue:[
					formatedString := 
							formatedString size < length 
								ifTrue:[ formatedString padded: #right to:length with: $0 ]
								ifFalse:[ formatedString copyFrom: 1 to: length ]
				].

			aStream nextPutAll:  formatedString
		].

	self offset printOnHoursMinutes: aStream.

	^aStream contents