class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :review
  has_many :likes
 
  has_many :images
  accepts_nested_attributes_for :images
  
  mount_uploader :image, ImageUploader
  
  

end
