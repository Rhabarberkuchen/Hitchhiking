class ApplicationController < ActionController::Base
  #authenticity token is veryfied; unveryfied requests throw an exception
  protect_from_forgery with: :exception

  #is done before CRUD actions are executed
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #defines which parameters can be accessed in authentication processes
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,
    :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :base, :countries, :km, :avatar, :avatar_cache, :remove_avatar, :password, :password_confirmation, :current_password])
  end

#defines path after sign in as the current user's profile
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end


end
