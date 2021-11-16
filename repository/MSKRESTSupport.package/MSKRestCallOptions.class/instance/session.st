Accessing
session

   "Return the value of the instance variable 'session'."
   ^session ifNil:[ restCallInstance isNil ifTrue:[ nil ] ifFalse:[ restCallInstance session ] ]