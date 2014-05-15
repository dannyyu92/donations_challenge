class Donation < ActiveRecord::Base
  belongs_to :donatable, polymorphic: true
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end
