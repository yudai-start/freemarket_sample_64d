class Image < ApplicationRecord
  belongs_to :item
  
  validates :item_id, presence: true
  validates :image, presence: true  
end
