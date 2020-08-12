class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_items
  has_many :comments
  has_many :ingredients, through: :recipe_items
  accepts_nested_attributes_for :recipe_items
  accepts_nested_attributes_for :ingredients
end
