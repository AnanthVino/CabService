Template.base_modal.rendered = ->
	$(@find '.active-modal').modal('show')
	$('.active-modal').on 'hide.bs.modal', (e) ->
		Modals.removeActiveModals()
	$('.active-modal').scroll ->
		$('.active-modal').data('bs.modal').handleUpdate()

Template.modal_buttons.helpers
	show_cancel_btn: ->
		return @show_cancel or true
	
	show_submit_btn: ->
		return @show_submit or true
	
	show_remove_btn: ->
		return @show_remove or false