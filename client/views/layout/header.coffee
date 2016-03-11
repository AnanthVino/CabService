Template.header_layout.helpers
	username: ->
		# console.log 'username:', Meteor.user()?.profile?.name
		return Meteor.user()?.profile?.name

	noti_count: ->
		noti = BookingRequest.find({cab_id: Meteor.userId()}).fetch()
		# console.log 'noti:::', noti
		return noti.length

	msg_count: ->
		# console.log 'msg count:::', @
		msg = Messages.find().fetch()
		# console.log 'msg:::', msg
		return msg.length

Template.header_layout.events
	'click #notification': ->
		Router.go 'booker_notification'
	'click #message': ->
		Router.go 'message'