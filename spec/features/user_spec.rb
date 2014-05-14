require 'spec_helper'

describe "User" do
  context "User does not yet exist" do
    it "should be able to register with valid information" do
      visit new_user_registration_path

      fill_in "Email", with: "testuser@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Sign up"

      expect(page).to have_content /.*Welcome! You have signed up successfully.*/
    end
  end

  context "User already exists" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "should be able to log in" do
      visit new_user_session_path

      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password

      click_button "Sign in"

      expect(page).to have_content /.*Signed in successfully.*/
    end
  end
end