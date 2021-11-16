other
get
	"GWCSwaggerAPIResourceListing new get response"

	[
		| resourceListing |
		resourceListing := self class jsonAPIText.
		response := 
			resourceListing isNil
				ifTrue:[ 	ZnResponse notFoundComment: 'Main API Declaration not found' 	]
				ifFalse:[	ZnResponse ok:  (ZnEntity with: resourceListing type: ZnMimeType applicationJsonUTF8)	].
	]
	on: Error
	do: [ :sig |
		response := ZnResponse serverError: sig asString
	].