class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_items
  has_many :comments
end
