*MSKRESTSupport
asRFC1123CookieStringOn: aStream

	| utc year month day |
	utc := self asUTC.
	utc dayMonthYearDo: [ :d :m :y | year := y. month := m. day := d ].
	aStream
		nextPutAll: utc dayOfWeekAbbreviation ;
		nextPut: $,;
		space ;
		nextPutAll: (day asString padded: #left to: 2 with: $0);
		nextPut: $-;
		nextPutAll: utc monthAbbreviation;
		nextPut: $-;
		nextPutAll: (year abs asString padded: #left to: 4 with: $0).
	aStream space.
	aStream
		nextPutAll: (utc hour asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (utc minute asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (utc second asInteger asString padded: #left to: 2 with: $0);
		nextPutAll: ' GMT'