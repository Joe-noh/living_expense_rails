$ ->
  $('#new_expense_button').on 'ajax:success', (data, res, xhr) ->
    $('#modal').html(res)
