require 'spec_helper'

describe "User" do
  context "User does not yet exist" do
    it "should be able to register with valid information" do
      visit new_user_registration_path

      fill_in "Email", with: "testuser@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Sign up"

      expect(page).to have_content /.*Successfully signed in.*/
    end
  end
end