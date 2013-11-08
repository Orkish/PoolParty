require 'spec_helper'

describe User do
  before :each do
    @user = User.new(firstname: "Yao", lastname: "Ming", username: "tallman21", email: "test@gmail.com", phone: "123-456-7890", about: "something about me")
    @trip = Trip.new(date: "12/25/13", time: "11:30pm", location: "Jersey City", destination: "New York", spaces: "2", info: "something additional")
    @user.trips << @trip
  end

  describe "trips" do
  	it "should be associated with the created trip" do
  		@user.trips.first.should eq(@trip)
  	end
  end
	
  it "should retun the first name of the user" do
		@user.firstname.should eq("Yao")
  end

  it "should return the last name of the user" do
    @user.lastname.should eq ("Ming")
  end

  it "should return the username of the user" do
    @user.username.should eq ("tallman21")
  end

  it "should return the email of the user" do
    @user.email.should eq ("test@gmail.com")
  end

  it "should return the phone number of the user" do 
    @user.phone.should eq ("123-456-7890")
  end

  it "should return the about of the user" do 
    @user.about.should eq ("something about me")
  end


end
