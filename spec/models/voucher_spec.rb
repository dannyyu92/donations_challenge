require 'spec_helper'

describe Voucher do
  describe "Create just a voucher" do
    before :each do
      @voucher = Voucher.new(expiration_date: 1.year.from_now)
    end

    it "is valid with valid attributes" do
      @voucher.should be_valid
    end

    it "is not valid with no date/time" do
      @voucher.expiration_date = nil
      @voucher.should_not be_valid
    end

    describe "Create an voucher with a donation" do
      before :each do
        @donation_voucher = FactoryGirl.create(:donation_voucher)
        @voucher = @donation_voucher.donatable
      end

      it "should respond to polymorphic association" do
        @donation_voucher.should respond_to :donatable
        @voucher.expiration_date.round.should eq(1.year.from_now.round)
      end
    end
  end
end
