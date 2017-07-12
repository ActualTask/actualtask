class Moderate::ModerateController < ApplicationController
  before_action :authenticate_user!
  before_action :check_moderator

  layout "moderate"

  protected

  def check_moderator
    redirect_to root_path, alert: "У Вас нет прав доступа к данной странице" unless current_user.moderator?
  end
end