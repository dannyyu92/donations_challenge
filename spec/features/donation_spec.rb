require 'spec_helper'

describe "Donation" do
  context "Given a valid user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as @user, scope: :user
      visit new_user_donation_path(@user)
      @donation = Donation.new(title: "A Title", description: "This is a descrip.")
    end

    it "should be able to create a new donation given a valid donation" do
      fill_in "donation_title", with: @donation.title
      fill_in "donation_description", with: @donation.description

      click_button "Submit"

      expect(page).to have_content /.*Successfully created.*/
    end
  end
end