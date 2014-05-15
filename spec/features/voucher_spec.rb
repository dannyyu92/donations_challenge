require 'spec_helper'
include DateTimeHelper

describe "Voucher" do
  context "Given a valid user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as @user, scope: :user
    end

    before :each do
      visit new_user_voucher_path(@user)
      @voucher = Voucher.new(expiration_date: 1.year.from_now)
      @donation = Donation.new(title: "A title", description: "Some descrip")
    end

    it "should be able to create a new voucher given a valid voucher" do
      select_date_and_time @voucher.expiration_date, from: "voucher_expiration_date"
      fill_in "voucher_title", with: @donation.title
      fill_in "voucher_description", with: @donation.description

      click_button "Submit"

      expect(page).to have_content /.*Successfully created.*/
    end
  end
end