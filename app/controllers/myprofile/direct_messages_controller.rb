class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    @dispute = Dispute.direct_message_for_users(users)
    @messages = @dispute.messages.order(created_at: :desc).limit(100).reverse
    @dispute_user = current_user.dispute_users.find_by(dispute_id: @dispute.id)
    render "disputes/show"
  end
end
