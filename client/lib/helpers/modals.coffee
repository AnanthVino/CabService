@Modals = 
	removeActiveModals: () ->
		$('.active-modal').remove()

	requestModal: (booking_data) ->
		data =
			modal_heading: "REQUEST MODAL"
			modal_inner_template: 'request_modal'
			modal_class: 'modal-md'
			booking_data: booking_data

		Blaze.renderWithData Template.base_modal, data, $('#main')[0]

	messageModal: (cab_info) ->
		data =
			modal_heading: "DRIVER MESSAGE MODAL"
			modal_inner_template: 'driver_message_modal'
			modal_class: 'modal-md'
			cab_info: cab_info

		Blaze.renderWithData Template.base_modal, data, $('#main')[0]