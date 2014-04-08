id = 0
setInterval (->
  chrome.storage.local.get 'doing_text', (obj) ->
    if obj.doing_text
      notify = new Notification 'Doing now',
        tag: "doing-now#{id++}"
        body: "You are doing \"#{obj.doing_text}\""
      setTimeout (-> notify.close()), 1000 * 10
      ), 1000 * 60 * 15 # 15 minutes