*MSKRESTSupport
_asIdentityBag

"Returns an IdentityBag that contains all of the elements of the receiver."

"Used by index creation."

| result  |


result := IdentityBag new .
result addAll: self.
^ result