*MSK-ModelBaseRuntime
pumMatches: regex

	regex isNil ifTrue:[ ^false ].
	^(regex matchesIn: self) notEmpty
