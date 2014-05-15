class Item < ActiveRecord::Base
  has_one :donation, as: :donatable, dependent: :destroy
  accepts_nested_attributes_for :donation


  validates :height, presence: true
  validates :width, presence: true
  validates :weight, presence: true
end
