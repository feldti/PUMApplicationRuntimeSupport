*MSKSwaggerSupport
swaggerMatchPath: path pattern: pattern
	"
		ZnRestServerUtils swaggerMatchPath: #('foo' '1' 'bar' '2') pattern: #('foo' '*' 'bar' '*')

		ZnRestServerUtils swaggerMatchPath: #('foo' '1' 'bar' '2') pattern: #('foo' '{studyid}' 'bar' '{userid}')
	"
	
	| result counter|
	path isNil ifTrue: [ ^ pattern isNil ifTrue: [ #() ] ifFalse: [ nil ] ].
	(pattern isNil or: [ path size ~= pattern size ]) ifTrue: [ ^ nil ].
	result := Dictionary new.

	counter := 1.
	"target is part of pattern !"
	pattern with: path do: [ :target :source |
		target = '*'
			ifTrue:[ result at: counter put: source. counter := counter + 1 ]
			ifFalse:[
				(target first = ${ and:[ target last = $} ])
					ifTrue:[
						| keyName |
						keyName := target copyFrom: 2 to: target size - 1.
						result at: keyName put: source
					]
					ifFalse:[
						source = target ifFalse: [ ^ nil ] 
					]
			]
	].

	^ result