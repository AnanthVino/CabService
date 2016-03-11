Template.message.events
	'click .send': ->
		message = $('.message').val()
		cab_id = Meteor.userId()
		
		data =
			message: message 
			cab_id: cab_id
			created_at: Date.now()
			booker_id: Meteor.user()?.booker_id
		MessageHelper.insertMessageData data

Template.message.helpers
	all_message: ->
		message= Messages.find().fetch()
		# console.log 'message::', message
		message
