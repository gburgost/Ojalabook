class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url :alert => exception.message
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:primer_nombre, :primer_apellido, :nombre_perfil, :email, :passwordm, :password_confirmation, :role])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:primer_nombre, :primer_apellido, :email, :password, :current_password, :avatar, :role) }
  end
end
