Template.request_modal.helpers
	booker_name: ->
		# console.log 'booker name this:::', @
		return @booking_data?.booker_name

	booker_address: ->
		return @booking_data?.booker_address

	booker_number: ->
		return @booking_data?.booker_number

Template.request_modal.events
	'click #send': (e) ->
		# console.log 'this:::', @
		booker_name = $('#booker_name').val()
		# console.log 'booker name:::', booker_name
		booker_address = $('#booker_location').val()
		# console.log 'booker location:::', booker_address
		booker_number = $('#booker_number').val()
		# console.log 'booker number:::', booker_number
		booker_message = $('#booker_message').val()
		# console.log 'booker message:::', booker_message
		data =
			booker_name : booker_name
			booker_address: booker_address
			booker_number: booker_number
			booker_message: booker_message
			booker_id: Meteor.userId()
			cab_id: @booking_data?.cab_id
		# console.log 'data::', data
		if $('#request_modal_form').parsley().validate()
			BookingHelper.insertBookingRequestData data
			$('.active-modal').modal('hide')


