Accessing
user

   ^session isNil 
			ifTrue:[	restCallInstance isNil ifTrue:[ nil ] ifFalse:[ restCallInstance session getApplicationUser] ]
			ifFalse:[ session getApplicationUser]