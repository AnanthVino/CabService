window.onload = ->
	GoogleMaps.init
		'sensor': false
		'key': Meteor.settings.public?.google_maps_api_key
		'language': 'en'
		'libraries': 'places'