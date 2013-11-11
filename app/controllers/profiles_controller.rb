class ProfilesController < ApplicationController

  def index
  end

  def trips
		if user_signed_in?
			@user = current_user
			@trips = Trip.all
		end
  end

  def new
    @trip = Trip.new
    # if @trip.save
    #   redirect_to user_path
    # end
  end

  def create
    

  end

end
