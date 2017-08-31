handleVisiblityChange = ->
    $strike = $(".strike")
    if $strike.length > 0
      dispute_id = $("[data-behavior='messages']").data("dispute-id")
      App.last_read.update(dispute_id)
      $strike.remove()

$(document).on "turbolinks:load", ->
  $(document).on "click", handleVisiblityChange

  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    dispute_id = $("[data-behavior='messages']").data("dispute-id")
    body        = $("#message_body")

    App.disputes.send_message(dispute_id, body.val())

    body.val("")
