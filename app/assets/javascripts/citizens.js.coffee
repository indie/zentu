# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.admin-approve-cb:checkbox').change ->
  $.ajax
    url: '/citizens/' + @value + '/set_approval'
    type: 'PUT'
    data: { approval: $(this).attr('checked') }
    success: -> alert('Citizen updated')