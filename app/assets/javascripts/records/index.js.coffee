$ ->
  $('#new_record_button').on 'ajax:success', (data, res, xhr) ->
    $('#modal').html(res)
