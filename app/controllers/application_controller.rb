class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!, except: [:top, :about]
  protect_from_forgery with: :null_session

  protected

  def after_sign_in_path_for(resource)
    member_path(current_member.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
