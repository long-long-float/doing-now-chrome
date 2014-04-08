$ ->
  chrome.storage.local.get 'github_username', (items) ->
    $('#github-username').val(items.github_username)

  $('#save-btn').click ->
    chrome.storage.local.set github_username: $('#github-username').val(), ->
      alert 'saved'