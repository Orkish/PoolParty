class HomeController < ApplicationController
	def splash
		if user_signed_in?
			@user = current_user
			redirect_to "/profile"
		else
			# redirect_to "/"
		end
	end

	def index
		
	end
	
end
