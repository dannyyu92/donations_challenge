class Item < ActiveRecord::Base
  validates :height, presence: true
  validates :width, presence: true
  validates :weight, presence: true
end
