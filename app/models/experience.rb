class Experience < ActiveRecord::Base
  validates :primary_contact_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
