Template.signup_form.events
	'click button#signup': (e) ->
		radio = $('.role:checked').val()
		# console.log 'radio:::', radio
		$form = $('#signup_form')
		# console.log 'form:', $form
		if $form.parsley().validate()
			LoginHelpers.signupWithForm $form

Template.signup_form.rendered = ->
	self = @
	autocomplete = new google.maps.places.Autocomplete(document.getElementById('location'), types: [ '(cities)'])

	google.maps.event.addListener autocomplete, 'place_changed', ->
		place = autocomplete.getPlace()
		# console.log "Place", place
		components = place?.address_components
		# console.log "COMPONENTS: ", components

		address = {}

		map =
			'locality': 'city'
			'administrative_area_level_1': 'state'
			'country': 'country'
		
		i = 0
		while i < components.length
			for x of map
				if components[i].types.indexOf(x) > -1
					if x == 'locality'
						address[map[x]] = components[i].long_name or components[i].short_name
					if x == 'administrative_area_level_1'
						address[map[x]] = components[i].long_name
					if x == 'country'
						address[map[x]] = components[i].long_name
			i++

		city = address.city
		# console.log 'city::',  city
		state = address.state
		# console.log 'state::',  state
		country = address.country
		# console.log 'country::',  country
		lat = place?.geometry?.location?.lat()
		# console.log 'lat::',  lat
		lng = place?.geometry?.location?.lng()
		# console.log 'lng::',  lng

		$( self.find '#location_lat' ).val(lat)
		$( self.find '#location_lng' ).val(lng)
		$( self.find '#location_city' ).val(city)
		$( self.find '#location_state' ).val(state)
		$( self.find '#location_country' ).val(country)
		$( self.find '#location_autocomplete_error' ).text('')