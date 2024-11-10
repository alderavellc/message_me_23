App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
  connected: function() {
    #Called when the subscription is ready for use on the server
    console.log('Connected to the chatroom');
  },

  disconnected: function() {
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from the chatroom');
  },

  received: function(data) {
    # Append the incoming message to the message container
    $('#message-container').append(data.mod_message);
    scroll_bottom();
  }
});
