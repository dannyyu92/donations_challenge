class Voucher < ActiveRecord::Base
  has_one :donation, as: :donatable, dependent: :destroy
  accepts_nested_attributes_for :donation
  
  validates :expiration_date, presence: true
end
