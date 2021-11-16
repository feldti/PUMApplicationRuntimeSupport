framework
restServiceClass
	"Indirekte Aufloesung der Klassenreferenz - ansonsten besteht die Gefahr auf eine alte Version der Klasse zu zeigen.

			Ev3RestCall new restServiceClass

	"

	 ^self class restServiceClass