*MSKRESTSupport
_asIdentityBag

"Returns an IdentityBag that contains all of the elements of the receiver."

	^ IdentityBag new
			addAll: self removeAll;
			yourself