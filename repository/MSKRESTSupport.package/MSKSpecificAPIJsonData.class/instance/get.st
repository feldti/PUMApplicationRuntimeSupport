other
get
	"Returns a specific API declaration "

	| resourceListing apiDeclarationWanted |

	apiDeclarationWanted := variables at: 1.

	resourceListing := self class jsonAPIText: apiDeclarationWanted.

	response := 
		resourceListing isNil
			ifTrue:[ 	ZnResponse notFoundComment: 'API Declaration not found <',apiDeclarationWanted asString,'>' 	]
			ifFalse:[	ZnResponse ok:  (ZnEntity with: resourceListing type: ZnMimeType applicationJsonUTF8)	].