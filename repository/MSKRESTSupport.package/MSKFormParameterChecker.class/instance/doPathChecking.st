checking
doPathChecking

	| pName rawValue |

	pName := swaggerParameter name.

	"Variable Werte sind IMMER da - ansonten wäre die RESTCall Instanz damit nicht beauftragt worden"
	rawValue := self option restCallInstance variables at: pName.

	^self doChecking: pName raw: rawValue