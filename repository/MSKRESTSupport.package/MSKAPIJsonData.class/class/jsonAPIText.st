other
jsonAPIText 
		"Method comment"

		| aMSKSwaggerResourceListing |
		aMSKSwaggerResourceListing := self manualRestCallSuperclass resourceSpecification.
		self autoRestCallSuperclass addResourceSpecificationTo: aMSKSwaggerResourceListing.

		^aMSKSwaggerResourceListing ifNotNil:[ NeoJSONWriter toString: aMSKSwaggerResourceListing ]