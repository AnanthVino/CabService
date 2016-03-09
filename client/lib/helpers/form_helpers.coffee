@FormHelpers = 
	getFormData: ($form) ->
		data = $form.serializeArray()
		_.object _.pluck(data, "name"), _.pluck(data, "value")
