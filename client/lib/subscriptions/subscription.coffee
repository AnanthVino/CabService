@Subscriber = 
	booker_request: () ->
		Meteor.subscribe 'booker_request'
	user_view: () ->
		Meteor.subscribe 'user_view'

