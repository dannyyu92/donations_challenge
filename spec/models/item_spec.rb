require 'spec_helper'

describe Item do
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
end
