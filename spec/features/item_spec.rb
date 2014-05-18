require 'spec_helper'

describe "Item" do
  context "Given a valid user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as @user, scope: :user
      visit new_user_item_path(@user)
      @item = Item.new(height: 100.1, width: 200.5, weight: 130.11)
      @donation = Donation.new(title: "A title", description: "Some descrip")
    end

    it "should be able to create a new item given a valid item" do
      fill_in "item_height", with: @item.height
      fill_in "item_width", with: @item.width
      fill_in "item_weight", with: @item.weight
      fill_in "item_title", with: @donation.title
      fill_in "item_description", with: @donation.description

      click_button "Submit"

      expect(page).to have_content /.*Successfully created.*/
    end
  end
end