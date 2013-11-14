class RegistrationsController < Devise::RegistrationsController
	# super
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :firstname, :lastname, :image, :remote_image_url, :phone, :email, :password) }
  end

end