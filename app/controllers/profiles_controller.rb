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
  end

  def create
    @trip = Trip.create(trip_params)
    current_user.trips << @trip
    render "profiles/index"
  end

  def send_sms
    trip_owner = User.find(params[:id])
    number = trip_owner.phone
    driver = trip_owner.username
    passenger_number = current_user.phone
    @client = Twilio::REST::Client.new ENV['TWIL_ID'], ENV['TWIL_TOKEN']
    @message = @client.account.messages.create({:to => "+1"+"#{number}", :from => "++17327047604", :body => "Howdy! Please Contact #{driver} at #{passenger_number}"})
    respond_to do |format|
      format.json {render :json => {driver: driver, phone: number}}
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:date, :time, :location, :destination, :spaces, :info)
  end

end
