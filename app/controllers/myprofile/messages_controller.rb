class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dispute

  def create
    message = @dispute.messages.new(message_params)
    message.user = current_user
    message.save
    MessageRelayJob.perform_later(message)
  end

  private

    def set_dispute
      @dispute = Dispute.find(params[:dispute_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
