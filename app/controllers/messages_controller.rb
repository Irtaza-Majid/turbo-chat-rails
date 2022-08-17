class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(msg_params)
  end

  private

  def msg_params
    params.require(:message).permit(:body).merge({ room_id: params[:room_id] })
  end
end
