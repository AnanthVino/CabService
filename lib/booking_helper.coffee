@BookingHelper = 
	insertBookingRequestData: (data) ->
		booking_id = BookingRequest.insert data
		# console.log 'booking id:::', booking_id
		booking = BookingRequest.findOne({_id: booking_id})
		console.log 'booking:::', booking
