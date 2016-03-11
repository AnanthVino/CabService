@UserHelpers = 
	updateProfile: (profile) ->
		Meteor.users.update Meteor.userId(), $set: { profile: profile }

	addBookerId: (driver_id, booker_id) ->
		console.log 'driver:::', driver_id
		console.log 'booker:::', booker_id
		user = Meteor.users.update({ _id: driver_id }, { $set:{ booker_id: booker_id }})
		console.log 'user:::', user
		