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


  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable

  end

 protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end




