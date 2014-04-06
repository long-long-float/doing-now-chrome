id_count = 0
setInterval (->
  chrome.storage.local.get 'doing_text', (obj) ->
    new Notification 'Doing now',
      tag: "doing-now#{id_count++}"
      body: "You are doing \"#{obj.doing_text}\""
    ), 1000 * 60 * 15 # 15 minutes