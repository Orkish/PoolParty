class HomeController < Devise::SessionsController
	def splash
		self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
	end

	def index
	end
	
end
