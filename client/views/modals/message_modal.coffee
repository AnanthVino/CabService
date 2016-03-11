# Template.driver_message_modal.events
# 	'click #send': (e) ->
# 		console.log 'this:::', @
# 		driver_message = $('#driver_message').val()
# 		console.log 'driver message:::', driver_message
# 		data =
# 			driver_message: driver_message
# 			cab_id: Meteor.userId()
# 			booker_id: @cab_info?.booker_id
# 		console.log 'data::', data
# 		if $('#driver_message_modal_form').parsley().validate()
# 			MessageHelper.insertMessageData data
# 			$('.active-modal').modal('hide')


