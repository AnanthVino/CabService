@MessageHelper = 
	insertMessageData: (data) ->
		message_id = Messages.insert data
		console.log 'message id:::', message_id
		message = Messages.findOne({_id: message_id})
		console.log 'message:::', message