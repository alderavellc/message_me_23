class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      # Use render_to_string to render the message partial to a string
      mod_message = render_to_string(partial: 'message', locals: { message: message })
      # Broadcast the rendered message to the chatroom_channel
      ActionCable.server.broadcast "chatroom_channel", mod_message: mod_message
    else
      render json: { error: 'Unable to save message' }, status: :unprocessable_entity
    end
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end
end
