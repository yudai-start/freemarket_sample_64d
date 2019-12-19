class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes
  has_many :images
  accepts_nested_attributes_for :images
  validates :name, :user_id,  :item_status, :shipping_fee_defrayer,  :ship_from_prefecture, :ship_date, :price, :description,  :status, presence: true 
  
  # def add_error_sample
  #   # nameが空のときにエラーメッセージを追加する
  #   if name.empty?
  #     errors.add(:name, "に関係するエラーを追加")
  #     errors[:base] << "モデル全体に関係するエラーを追加"
  #   end
  # end

#   validates :name, :user_id, :size, :item_status, :shipping_fee_defrayer, :shipping_system, :ship_from_prefecture, :ship_date, :price, :description, :buyer_id, :status, presence: true

  

end

