writing
writeMap: keyValueCollection
	self writeMapStreamingDo: [ :jsonMapWriter |
		keyValueCollection openAPIKeysAndValuesDo: [ :key :value |
			jsonMapWriter writeKey: key value: value ] ]