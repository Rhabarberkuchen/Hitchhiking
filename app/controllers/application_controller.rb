class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :base, :countries, :km, :avatar, :avatar_cache, :remove_avatar, :password, :password_confirmation, :current_password])
  end

def after_sign_in_path_for(resource)
user_path(@user.id)
end


end
