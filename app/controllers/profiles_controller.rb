class ProfilesController < ApplicationController

  def index
    @trip = Trip.new
    @user = current_user
  end

  def trips
		if user_signed_in?
			@user = current_user
			@trips = Trip.all
		end
  end

  def show
    trip = Trip.find(params[:id])
    driver = User.find(trip.user_id);
    respond_to do |format|
  		format.json {render :json => {driver: driver.username, date: trip.date, time: trip.time, location: trip.location, destination: trip.destination, spaces: trip.spaces, info: trip.info}}
  	end
  end

  def new
  end

  def create
    @trip = Trip.create(trip_params)
    current_user.trips << @trip
    redirect_to "/profile/index"
  end

  def send_sms
    trip_owner = User.find(params[:id])
    number = trip_owner.phone
    driver = trip_owner.username
    passenger_number = current_user.phone
    passenger_name = current_user.username
    @client = Twilio::REST::Client.new ENV['TWIL_ID'], ENV['TWIL_TOKEN']
    @message = @client.account.messages.create({:to => "+1"+"#{number}", :from => "+13475805712", :body => "Hello from Pool Party! You have a lift request. Contact #{passenger_name} at #{passenger_number} to set up your meeting.  Please text responsibly."})
    respond_to do |format|
      format.json {render :json => {driver: driver, phone: number}}
    end
  end

  def delete_trip
    trip = Trip.find(params[:trip])
    trip_id = trip.id
    trip.delete
    respond_to do |format|
      format.json {render :json => {deleted: trip_id}}
    end    
  end

  private

  def trip_params
    params.require(:trip).permit(:date, :time, :location, :destination, :spaces, :info)
  end

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :destination, :spaces, :info)
  end

  def user_edit
    form_data = params[:user]
    puts form_data
    if form_data[:email].blank? || form_data[:email] == ""
      form_data[:email] = current_user.email
    end
    current_user.update_attributes(form_data)
    current_user.save
    redirect_to "/profiles"
  end

end















