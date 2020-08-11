class ShoppingList < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :recipe_items
end
