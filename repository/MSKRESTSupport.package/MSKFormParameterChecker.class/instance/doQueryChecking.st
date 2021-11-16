checking
doQueryChecking

	| pName rawValue   |

	pName := swaggerParameter name.

	"Variable Werte sind IMMER da - ansonten wäre die RESTCall Instanz damit nicht beauftragt worden"
	rawValue := self option restCallInstance request uri queryAt: pName ifAbsent: [ nil ].
	^self doChecking: pName raw: rawValue