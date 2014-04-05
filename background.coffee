setInterval (->
  chrome.storage.local.get 'doing_text', (obj) ->
    console.log "You are doing \"#{obj.doing_text}\""
    chrome.notifications.create 'doing-now',
      type: 'basic', title: 'Doing now', 
      message: "You are doing \"#{obj.doing_text}\"",
      (id) ->
        console.log 'ok!'
    ), 5000