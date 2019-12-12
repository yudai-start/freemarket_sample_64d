class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes
  has_many :images

  validates :name, :user_id, :size, :item_status, :shipping_fee_defrayer, :shipping_sysytem, :ship_from_prefecture, :ship_date, :price, :description, :buyer_id, :status, presence: true
  
end
