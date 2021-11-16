adding
addSessionParameter: callClass location: locationMethodSymbol

	| aMSKSwaggerParameterDescription |

	(aMSKSwaggerParameterDescription := callClass restServiceSessionClassExtParameter) isNil ifTrue:[ ^self ].

	aMSKSwaggerParameterDescription
		beOptional ;
		definedBlock: callClass defaultParameterDefinedBlock ;
		perform: locationMethodSymbol.

	self addParameter: aMSKSwaggerParameterDescription