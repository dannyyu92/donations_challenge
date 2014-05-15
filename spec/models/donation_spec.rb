require 'spec_helper'

describe Donation do
  before :each do
    @donation = Donation.new(title: "Some Title", description: "Some description")
  end

  it "is valid with valid attributes" do
    @donation.should be_valid
  end

  it "is not valid without a title" do
    @donation.title = nil
    @donation.should_not be_valid
  end

  it "is not valid without a description" do
    @donation.description = nil
    @donation.should_not be_valid
  end
end
