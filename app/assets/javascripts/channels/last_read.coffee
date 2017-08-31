App.last_read = App.cable.subscriptions.create "LastReadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  update: (dispute_id)->
    @perform "update", {dispute_id: dispute_id}
