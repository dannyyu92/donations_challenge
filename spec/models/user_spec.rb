require 'spec_helper'

describe User do
  before :each do
    @user = User.new(email: "testuser@example.com", password: "password")
  end

  it "is valid with valid attributes" do
    @user.should be_valid
  end

  it "is not valid without an email" do
    @user.email = nil
    @user.should_not be_valid
  end

  it "is not valid without a password" do
    @user.password = nil
    @user.should_not be_valid
  end
end
