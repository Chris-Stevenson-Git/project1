class Ingredient < ApplicationRecord
  has_many :recipe_items
  has_many :shopping_list_items
  accepts_nested_attributes_for :recipe_items
end
