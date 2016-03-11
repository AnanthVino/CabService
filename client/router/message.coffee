Router.map ->
	@route "message",
	path: "/message"
	layoutTemplate: "header_layout"
	template: "message"
	onAfterAction: ->
			Subscriber.user_view()