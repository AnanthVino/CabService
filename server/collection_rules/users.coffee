Meteor.users.allow 
	update: (userId, doc, fieldNames, modifier) ->
		console.log 'userId::', userId
		console.log 'doc::::', doc
		if doc?.profile?.role is 'driver'
			return true
