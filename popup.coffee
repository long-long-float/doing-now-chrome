$ ->
  $main = $('#main')

  $doing_text = $('<div>').text('Write what are you doing.')
  $doing_input = $('<input>').attr('type', 'text')

  btn_class = 'btn btn-default btn-sm'
  $edit_btn = $('<button>')
    .attr(type: 'button', class: btn_class).text('edit')
    .click ->
      $main.children().detach()
      $main.append($doing_input, $save_btn)
  $save_btn = $('<button>')
    .attr(type: 'button', class: btn_class).text('save')
    .click ->
      $main.children().detach()
      $main.append($doing_text, $edit_btn)

  $('#main').append($doing_text, $edit_btn)