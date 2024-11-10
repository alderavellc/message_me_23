class MessagesController < ApplicationController
  before_action :require_user

def create
  message = current_user.messages.build(message_params)
  if message.save
    rendered_message = message_render(message)
    ActionCable.server.broadcast "chatroom_channel", mod_message: rendered_message
  else
    # Handle failure
    render json: { error: 'Message failed to save' }, status: :unprocessable_entity
  end
end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
