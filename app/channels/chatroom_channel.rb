class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    message = Message.create!(body: data["body"], user: current_user, chatroom: chatroom)
    # Broadcasting the message after it's created
    broadcast_to "chatroom_channel", mod_message: render_message(message)
  end
end
