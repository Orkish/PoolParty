class HomeController < ApplicationController
	def splash
		if user_signed_in?
			@user = current_user
			render "profiles/index"
		end
	end

	def index
	end
	
end
