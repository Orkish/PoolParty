class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :firstname, :lastname, :image, :remote_image_url, :phone, :email, :password) }
  end

## This overrides devise's sanitizer.

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

 #  before_filter :update_sanitized_params, if: :devise_controller?

	# def update_sanitized_params
 #  	devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :firstname, :lastname, :image, :remote_image_url, :phone, :email, :password)}
	# end



end
