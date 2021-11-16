cookie
sessionCookie


	^(ZnCookie name: self class cookieName value: __id)
		path: self class cookiePath ;
		expires: (self expiration asRFC1123CookieString) ;
		yourself