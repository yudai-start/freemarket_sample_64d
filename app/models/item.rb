class Item < ApplicationRecord
  has_many :likes
  has_many :images
end
