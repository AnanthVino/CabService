Template.login_form.events
	'click button#login' : (e) ->
		$form = $('#login_form')
		console.log 'form:', $form
		if $form.parsley().validate()
			LoginHelpers.loginWithForm $form