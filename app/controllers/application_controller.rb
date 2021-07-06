class ApplicationController < ActionController::Base
  # 作業用に無効化
  # before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :password_confirmation])
  end

end
