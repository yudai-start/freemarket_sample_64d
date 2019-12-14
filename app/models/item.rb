class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes

  has_many :images
  accepts_nested_attributes_for :images
  
  

  # validates :name, :user_id,  :item_status, :shipping_fee_defrayer,  :ship_from_prefecture, :ship_date, :price, :description,  :status, presence: true
  
end
