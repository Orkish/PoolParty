require 'spec_helper'

describe User do
  before :each do
    @user = User.new(firstname: "Yao", lastname: "Ming", username: "tallman21", email: "test@gmail.com", phone: "123-456-7890", about: "something about me")
    # @trip = Trip.new(date: "12/25/13", time: "11:30pm", location: "Jersey City", destination: "New York", available_space: "2", additional_info: "something additional")
    # @user.trips << @trip
  end

  describe "trips" do
  	it "should be associated with the created trip" do
  		@user.trip.first.should eq(@trip)
  	end
  end
	
  it "should retun the first name of the user" do
		@user.firstname.should eq("Yao")
  end
end
