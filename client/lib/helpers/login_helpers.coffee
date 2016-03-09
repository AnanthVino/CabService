@LoginHelpers = 
	loginWithForm: ($form) ->
		data = FormHelpers.getFormData $form
		console.log 'login data:', data
		Meteor.loginWithPassword data.email, data.password, (err, result) ->
			if err 
				return $form.find('.error-container').text err.reason
			Router.go 'home'

	logout: (route='login') ->
		Meteor.logout ->
			Router.go(route)

	signupWithForm: ($form) ->
		data = FormHelpers.getFormData $form
		console.log 'data:', data

		Accounts.createUser { email: data.email, password: data.password }, (err, res) ->
			console.log 'err:', err
			console.log 'res:'
			if err
				return $form.find('.error-container').text err.reason

			location = 
				city: data.city
				state: data.state
				country: data.country
				geometry:
					type: "Point"
					coordinates: [ data.lng, data.lat ]

			profile = 
				name: data.name
				phone: data.phone
				role: data.role
				location: location

			console.log 'profile:', profile

			UserHelpers.updateProfile profile
			Router.go 'home'
			



		