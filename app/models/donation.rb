class Donation < ActiveRecord::Base
  belongs_to :donatable, polymorphic: true
end
