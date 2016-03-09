Template.header_layout.helpers
	username: ->
		console.log 'username:', Meteor.user()?.profile?.name
		return Meteor.user()?.profile?.name