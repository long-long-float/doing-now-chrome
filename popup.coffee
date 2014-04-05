$ ->
  cstorage = chrome.storage.local

  $main = $('#main')

  $doing_text = $('<div>')
  cstorage.get 'doing_text', (obj) ->
    if obj.doing_text
      $doing_text.text(obj.doing_text)
    else
      $doing_text.text('Write what are you doing.').addClass('default-text')
  $doing_input = $('<input>').attr(type: 'text')

  btn_class = 'btn btn-default btn-sm'
  $edit_btn = $('<button>')
    .attr(type: 'button', class: btn_class).text('edit')
    .click ->
      cstorage.get 'doing_text', (obj) ->
        $main.children().detach()
        $main.append($doing_input.val(obj.doing_text), $save_btn)
  $save_btn = $('<button>')
    .attr(type: 'button', class: btn_class).text('save')
    .click ->
      text = $doing_input.val()
      cstorage.set doing_text: text, ->
        $main.children().detach()
        $main.append($doing_text.text(text), $edit_btn)

  $('#main').append($doing_text, $edit_btn)