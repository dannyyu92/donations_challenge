class Item < ActiveRecord::Base
  has_many :donations, as: :donatable

  validates :height, presence: true
  validates :width, presence: true
  validates :weight, presence: true
end
