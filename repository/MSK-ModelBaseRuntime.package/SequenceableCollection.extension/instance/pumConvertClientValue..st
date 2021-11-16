*MSK-ModelBaseRuntime
pumConvertClientValue: conversionBlock

	^self collect:[ :each | each pumConvertClientValue: conversionBlock ].
