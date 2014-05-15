require 'spec_helper'

describe Item do
  describe "Create just an item" do
    before :each do
      @item = Item.new(height: 100, width: 200, weight: 150)
    end

    it "is valid with valid attributes" do
      @item.should be_valid
    end

    it "is not valid without a height" do
      @item.height = nil
      @item.should_not be_valid
    end

    it "is not valid without a width" do
      @item.width = nil
      @item.should_not be_valid
    end

    it "is not valid without a weight" do
      @item.weight = nil
      @item.should_not be_valid
    end

    describe "Create an item with a donation" do
      before :each do
        @donation_item = FactoryGirl.create(:donation_item)
        @item = @donation_item.donatable
      end

      it "should respond to polymorphic association" do
        @donation_item.should respond_to :donatable
        @item.height.should == 100
        @item.width.should == 200
        @item.weight.should == 300
      end
    end

  end
end
