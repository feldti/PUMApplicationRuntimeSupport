gsquerysupport
apiClassGetDomainPropertyAccessorPath: propertyName
	"Method to build a Sorteollection based on a ExtJS Sort String"

	| accessPath |

	(accessPath := self getDomainPropertyAccessorPath: propertyName) notNil ifTrue:[ ^accessPath ].

	^self getDomainPropertyAccessorPath: propertyName asLowercase
