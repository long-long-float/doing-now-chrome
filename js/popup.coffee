$ ->
  #variables

  cstorage = chrome.storage.local

  $main = $('#main')

  $doing_text = $doing_input = $edit_btn = $save_btn = $finish_btn = null

  #functions

  modes = ['show', 'edit']
  changeMode = (modename) ->
    for mode in modes
      $("##{mode}-mode").css(display: if modename == mode then '' else 'none')

  updateDoingText = (text) ->
    if text
      $doing_text.text(text).removeClass('default-text')
    else
      $doing_text.text('Write what are you doing.').addClass('default-text')

  loadDoingText = ->
    cstorage.get 'doing_text', (obj) ->
      updateDoingText(obj.doing_text)

  save_and_show_mode = ->
    cstorage.set doing_text: $doing_input.val(), ->
      loadDoingText()
      changeMode 'show'

  #elements

  $doing_text = $('#doing-text')
  $doing_input = $('#doing-input')
    .keypress (e) ->
      if e.which == 13
        save_and_show_mode()

  $edit_btn = $('#edit-btn')
    .click ->
      cstorage.get 'doing_text', (obj) ->
        $doing_input.val(obj.doing_text)
        changeMode 'edit'
  $save_btn = $('#save-btn')
    .click ->
      save_and_show_mode()
  $finish_btn = $('#finish-btn')
    .click ->
      cstorage.set doing_text: '', ->
        updateDoingText('')

  #initialize
  loadDoingText()