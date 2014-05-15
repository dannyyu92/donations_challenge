class Experience < ActiveRecord::Base
  has_one :donation, as: :donatable, dependent: :destroy
  accepts_nested_attributes_for :donation

  validates :primary_contact_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
