class Voucher < ActiveRecord::Base
  has_many :donations, as: :donatable
  
  validates :expiration_date, presence: true
end
