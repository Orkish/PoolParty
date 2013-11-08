require 'spec_helper'

describe User do
  it "creates a user with the given parameters" do
    before :each do
      @user = User.new(firstname: "Yao", lastname: "Ming", username: "tallman21", email: "test@gmail.com", phone: "123-456-7890", about: "something about me")
    end
  end
end
