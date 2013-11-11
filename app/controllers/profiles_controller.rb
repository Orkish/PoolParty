class ProfilesController < ApplicationController

  def index
  end

  def trips
		if user_signed_in?
			@user = current_user
			@trips = Trip.all
		end
  end

end
