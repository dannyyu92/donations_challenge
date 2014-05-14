require 'spec_helper'

describe Voucher do
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
end
