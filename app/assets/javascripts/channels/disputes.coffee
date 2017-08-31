App.disputes = App.cable.subscriptions.create "DisputesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_dispute = $("[data-behavior='messages'][data-dispute-id='#{data.dispute_id}']")
    if active_dispute.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_dispute.append("<div class='strike'><span>Unread Messages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.name, {body: data.body})

      else
        App.last_read.update(data.dispute_id)

      # Insert the message
      active_dispute.append("<div><strong>#{data.name}:</strong> #{data.body}</div>")

    else
      $("[data-behavior='dispute-link'][data-dispute-id='#{data.dispute_id}']").css("font-weight", "bold")

  send_message: (dispute_id, message) ->
    @perform "send_message", {dispute_id: dispute_id, body: message}
