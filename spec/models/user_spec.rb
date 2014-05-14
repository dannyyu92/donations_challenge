require 'spec_helper'

describe User do
  it "is valid with valid attributes" do
    User.new(email: "testuser@example.com", password: "password").should be_valid
  end

  it "is not valid without an email" do
    user = User.new(email: nil, password: "password")
    user.should_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(email: "testuser@example.com", password: nil)
    user.should_not be_valid
  end
end
