$ ->
  #variables
  cstorage = chrome.storage.local

  $main = $('#main')

  $doing_text = $doing_input = $edit_btn = $save_btn = $finish_btn = null

  #functions

  updateDoingText = (text) ->
    if text
      $doing_text.text(text).removeClass('default-text')
    else
      $doing_text.text('Write what are you doing.').addClass('default-text')

  loadDoingText = ->
    cstorage.get 'doing_text', (obj) ->
      updateDoingText(obj.doing_text)

  #elements

  $doing_text = $('<div>')
  $doing_input = $('<input>').attr(type: 'text')

  $edit_btn = $('<button>').text('edit')
    .click ->
      cstorage.get 'doing_text', (obj) ->
        $main.children().detach()
        $doing_input.val(obj.doing_text)
        $main.append(editGroup)
  $save_btn = $('<button>').text('save')
    .click ->
      cstorage.set doing_text: $doing_input.val(), ->
        $main.children().detach()
        loadDoingText()
        $main.append(showGroup)
  $finish_btn = $('<button>').text('finish!')
    .click ->
      cstorage.set doing_text: '', ->
        updateDoingText('')

  #initialize

  showGroup = [$doing_text, $edit_btn, $finish_btn]
  editGroup = [$doing_input, $save_btn]

  $('#main').append(showGroup)
  loadDoingText()