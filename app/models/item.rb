class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes
  has_many :images
  accepts_nested_attributes_for :images
  
  # validates :name, :user_id,  :item_status, :shipping_fee_defrayer,  :ship_from_prefecture, :ship_date, :price, :description,  :status, presence: true 末本編集部分
  # validates :name, :user_id, :size, :item_status, :shipping_fee_defrayer, :shipping_system, :ship_from_prefecture, :ship_date, :price, :description, :buyer_id, :status, presence: true

  belongs_to_active_hash :item_status
  validates :name, :user_id,  :item_status_id, :shipping_fee_defrayer_id,  :ship_from_prefecture, :ship_date_id, :price, :description,  :status, presence: true 

end

