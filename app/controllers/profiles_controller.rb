class ProfilesController < ApplicationController

  def index
  end

  def trips
		if user_signed_in?
			@user = current_user
			@trips = Trip.all
		end
  end

  def show
  trip = Trip.find(params[:id])
  respond_to do |format|
		format.json {render :json => {date: trip.date, time: trip.time, location: trip.location, destination: trip.destination, spaces: trip.spaces, info: trip.info}}
	end

  end

  def new
    @trip = Trip.new
    # if @trip.save
    #   redirect_to user_path
    # end
  end

  def create
    @trip = Trip.create(trip_params)
    current_user.trips << @trip
    render "profiles/index"
  end

  private

  def trip_params
    params.require(:trip).permit(:date, :time, :location, :destination, :spaces, :info)
  end

end
