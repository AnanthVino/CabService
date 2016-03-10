ReverseGeoToCity = (lat, lng) ->
	console.log 'lat  lng:::', lat, lng
	latlng = new (google.maps.LatLng)(lat, lng)
	console.log 'latlng:::', latlng
	geocoder= new google.maps.Geocoder()
	geocoder.geocode { 'latLng': latlng }, (results, status) ->
		console.log 'results:::', results
		console.log 'status::::', status
		if status == google.maps.GeocoderStatus.OK
			if results[0]
				console.log 'result::::', results[0]?.formatted_address
				return results[0]?.formatted_address


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

	google.maps.event.addListener map, 'click', (event) ->
		event_location = []
		latitude = event.latLng?.lat()
		event_location.push latitude
		longitude = event.latLng?.lng()
		event_location.push longitude
		setMarker event_location, map

		drivers = Meteor.users.find({'profile.role': 'driver'}).fetch()
		return _.filter drivers, (d) ->
			console.log 'd is::', d
			if d?.profile?.role is 'driver'
				# console.log 'lat:::', d?.profile?.location?.geometry?.coordinates[1] 
				# console.log 'lng:::', d?.profile?.location?.geometry?.coordinates[0]
				# console.log 'lat1:::', Meteor.user()?.profile?.location?.geometry?.coordinates[1] 
				# console.log 'lng1:::', Meteor.user()?.profile?.location?.geometry?.coordinates[0]  
				lat1 = d?.profile?.location?.geometry?.coordinates[1] 
				lon1 = d?.profile?.location?.geometry?.coordinates[0]
				lat2 = latitude 
				lon2 = longitude 
				unit = 'K'
				# distance = (lat1, lon1, lat2, lon2, unit) ->
				radlat1 = Math.PI * lat1 / 180
				radlat2 = Math.PI * lat2 / 180
				theta = lon1 - lon2
				radtheta = Math.PI * theta / 180
				dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
				dist = Math.acos(dist)
				dist = dist * 180 / Math.PI
				dist = dist * 60 * 1.1515
				if unit == 'K'
					dist = dist * 1.609344
					# console.log 'dist:', dist
				if unit == 'N'
					dist = dist * 0.8684
					# console.log 'dist:', dist
				# console.log ';;;;;;;;;', dist
				distance = parseInt(dist)
				# console.log 'distance:::', distance
				if distance <= 3
					# console.log 'ddddd::::::', d
					setTimeout ->
						toastr.success 'Cab available to this place'
						latlng = new (google.maps.LatLng)(lat2, lon2)
						console.log 'latlng:::', latlng
						geocoder= new google.maps.Geocoder()
						geocoder.geocode { 'latLng': latlng }, (results, status) ->
							console.log 'results:::', results
							console.log 'status::::', status
							if status == google.maps.GeocoderStatus.OK
								if results[0]
									console.log 'result::::', results[0]?.formatted_address
									address = results[0]?.formatted_address
									booking_data =
										booker_name : Meteor.user()?.profile?.name
										booker_address: address
										booker_number: Meteor.user()?.profile?.phone
										booker_id: Meteor.userId()
										cab_id: d?._id
									console.log 'booking data:::', booking_data

									Modals.requestModal booking_data
					,2000

					
			# 		# console.log 'lat:::', d?.profile?.location?.geometry?.coordinates[1] 
			# 		# console.log 'lng:::', d?.profile?.location?.geometry?.coordinates[0] 
			# 		l11: d?.profile?.location?.geometry?.coordinates[1] 
			# 		longitude1: d?.profile?.location?.geometry?.coordinates[0] 
			# 	},{
			# 			latitude1: Meteor.user()?.profile?.location?.geometry?.coordinates?[1]
			# 			longitude2: Meteor.user()?.profile?.location?.geometry?.coordinates?[0]
			# 	})
			# 	if distance >= 300 * 1000
			# 		return true
			# return false
		


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

setMarker = (location, map) ->
	langit = location[1]
	# console.log 'langit::', langit
	latit = location[0]
	# console.log 'latit:::', latit
	myLatLng = new (google.maps.LatLng)(latit, langit)
	marker = new (google.maps.Marker)(
		position: myLatLng
		label: labels[labelIndex++ % labels.length]
		map: map)


Template.home.events
	'click #check_cab': ->
		if Meteor.user()?.profile?.role is "passenger"
			initialize()
			