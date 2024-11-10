App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connected to the chatroom")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("Disconnected from the chatroom")

  received: (data) ->
    console.log("Received data:", data)
    $('#message-container').append data.mod_message
    scroll_bottom()  # Ensure this function is defined elsewhere to scroll to the bottom
