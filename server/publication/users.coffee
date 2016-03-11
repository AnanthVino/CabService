Meteor.publish 'user_view',  ->
	q = 
		_id: @userId
	opts = 
		fields: 
			emails: 1
			profile: 1
			booker_id: 1

	Meteor.users.find q, opts