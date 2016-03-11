Template.booker_notification.helpers
	notification: ->
		req_msg = BookingRequest.find({cab_id: Meteor.userId()}).fetch()
		# console.log 'request message:::', req_msg
		return req_msg

Template.booker_notification.events
	'click #reply': ->
		# console.log 'reply this:::', @
		Router.go 'message'


