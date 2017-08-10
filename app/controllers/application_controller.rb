class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  add_flash_types :success, :danger, :infos, :warning

  before_action :set_locale


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  protect_from_forgery with: :exception
  helper_method :google_user

  def google_user
    @google_user||= User.find(session[:user_id]) if session[:user_id]
  end
end


