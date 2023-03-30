class ApplicationController < ActionController::Base
  before_action :authenticate_user! unless Rails.env == 'test'
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def authenticate_user!
    redirect_to root_path unless User.any?
  end

  def after_sign_in_path_for(_resource)
    groups_url
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
