*MSKRESTSupport
asQDotUsageStatTimeStringOn: aStream

	| utc year month day |
	utc := self asUTC.
	utc dayMonthYearDo: [ :d :m :y | year := y. month := m. day := d ].
	aStream
		nextPutAll: utc monthAbbreviation;
		space ;
		nextPutAll: (day asString padded: #left to: 2 with: $0);
		nextPut: $,;
		space ;
		nextPutAll: (year abs asString padded: #left to: 4 with: $0).
	aStream space.
	self time print24: false on: aStream