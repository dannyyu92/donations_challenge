require 'spec_helper'

describe Experience do
  describe "Create just an experience" do
    before :each do
      @exp = Experience.new(primary_contact_name: "Danny", latitude: 40.7527987, longitude: -73.974788)
    end

    it "is valid with valid attributes" do
      @exp.should be_valid
    end

    it "is not valid without a primary contact name" do
      @exp.primary_contact_name = nil
      @exp.should_not be_valid
    end

    it "is not valid without a latitude" do
      @exp.latitude = nil
      @exp.should_not be_valid
    end

    it "is not valid without a longitude" do
      @exp.longitude = nil
      @exp.should_not be_valid
    end

    describe "Create an experience with a donation" do
      before :each do
        @donation_experience = FactoryGirl.create(:donation_experience)
        @experience = @donation_experience.donatable
      end

      it "should respond to polymorphic association" do
        @donation_experience.should respond_to :donatable
        @experience.primary_contact_name.should == "John Doe"
        @experience.latitude.should == @exp.latitude
        @experience.longitude.should == @exp.longitude
      end
    end

  end
end
