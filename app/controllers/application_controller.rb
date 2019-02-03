class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :description, :email, :password, :remember_me, :image, :image_cache, :remove_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :description, :email, :password, :current_password, :image, :image_cache, :remove_image])
  end

end
