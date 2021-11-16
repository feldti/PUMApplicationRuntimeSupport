Updating
data: newValue

	"simple hack to make the new behaviour happening ... errors are always returned in <error> and not in <data> any more"
	newValue class = MSKRESTError 
		ifTrue:[ ^self error: newValue ].

   "Modify the value of the instance variable 'data'."
   data := newValue