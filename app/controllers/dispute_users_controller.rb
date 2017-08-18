class DisputeUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dispute

  def create
    @dispute_user = @dispute.dispute_users.where(user_id: current_user.id).first_or_create
    redirect_to @dispute
  end

  def destroy
    @dispute_user = @dispute.dispute_users.where(user_id: current_user.id).destroy_all
    redirect_to disputes_path
  end

  private

    def set_dispute
      @dispute = Dispute.find(params[:dispute_id])
    end
end
