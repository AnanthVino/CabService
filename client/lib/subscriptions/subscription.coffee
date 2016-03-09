@Subscriber = 
	profile: (user_id) ->
		console.log 'sub user id::::', user_id
		Meteor.subscribe 'basic_profile', user_id