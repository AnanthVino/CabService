labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
labelIndex = 0

initialize = () ->
	mapOptions = 
		center: new (google.maps.LatLng)(12.97, 77.59)
		zoom: 12
	map = new (google.maps.Map)(document.getElementById('map'), mapOptions)

	users = Meteor.users.find({'profile.role': 'driver'}).fetch()
	user_locations = _.pluck users, "profile"
	addMarker(user_locations, map)

addMarker = (locations, map) ->
	i = 0
	while i < locations.length
		location = locations[i]
		langit = location?.location?.geometry?.coordinates[0]
		latit = location?.location?.geometry?.coordinates[1]
		myLatLng = new (google.maps.LatLng)(latit, langit)
		marker = new (google.maps.Marker)(
			position: myLatLng
			label: labels[labelIndex++ % labels.length]
			map: map)
		i++

Template.home.events
	'click #check_cab': ->
		if Meteor.user()?.profile?.role is "passenger"
			initialize()
			