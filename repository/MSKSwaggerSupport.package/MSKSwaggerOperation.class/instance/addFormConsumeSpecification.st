Updating
addFormConsumeSpecification

	(self consumes includes: 'application/x-www-form-urlencoded')
		ifFalse:[ self consumes 	add: 'application/x-www-form-urlencoded' ]