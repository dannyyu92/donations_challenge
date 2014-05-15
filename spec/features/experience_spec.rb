require 'spec_helper'

describe "Experience" do
  context "Given a valid user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as @user, scope: :user
    end

    before :each do
      visit new_user_experience_path(@user)
      @experience = Experience.new(primary_contact_name: "John Doe", latitude: "40.7527987", longitude: "-73.974788")
      @donation = Donation.new(title: "A title", description: "Some descrip")
    end

    it "should be able to create a new experience given a valid experience" do
      fill_in "experience_name", with: @experience.primary_contact_name
      fill_in "experience_latitude", with: @experience.latitude
      fill_in "experience_longitude", with: @experience.longitude
      fill_in "experience_title", with: @donation.title
      fill_in "experience_description", with: @donation.description

      click_button "Submit"

      expect(page).to have_content /.*Successfully created.*/
    end
  end
end