require 'spec_helper'

describe Trip do
  before :each do
  	@trip = Trip.new(date: "12/25/13", time: "11:30pm", location: "Jersey City", destination: "New York", spaces: 3, info: "something additional")
  end

  it "should return the date of the trip in string format" do
  	@trip.date.should eq("12/25/13")
  end
	
	it "should return the time of the trip in string format" do
  	@trip.time.should eq("11:30pm")
  end
	
	it "should return the starting location of the trip in string format" do
  	@trip.location.should eq("Jersey City")
  end
	
	it "should return the destination of the trip in string format" do
  	@trip.destination.should eq("New York")
  end
	
	it "should return the available number of spaces for the trip as an integer" do
  	@trip.spaces.should eq(3)
  end
  
  it "should return additional info of the trip in string format" do
  	@trip.info.should eq("something additional")
  end

end
