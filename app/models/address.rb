class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :street_number, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
end
