class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
