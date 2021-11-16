gsquerysupport
apiClassGetDomainPropertyConversionSourcetext: propertyName
	"Method to build a Sorteollection based on a ExtJS Sort String"

	| accessPath |

	(accessPath := self getDomainPropertyConversionSourcetext: propertyName) notNil ifTrue:[ ^accessPath ].

	^self getDomainPropertyConversionSourcetext: propertyName asLowercase
