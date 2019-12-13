class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :review
  has_many   :likes
  has_many   :images
end
