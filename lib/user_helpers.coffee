@UserHelpers = 
	updateProfile: (profile) ->
		Meteor.users.update Meteor.userId(), $set: { profile: profile }
