class Experience < ActiveRecord::Base
  has_many :donations, as: donatable

  validates :primary_contact_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
