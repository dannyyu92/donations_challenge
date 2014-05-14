class Voucher < ActiveRecord::Base
  validates :expiration_date, presence: true
end
