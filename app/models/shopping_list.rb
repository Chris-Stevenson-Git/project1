class ShoppingList < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :shopping_list_items
  has_many :ingredients, through: :shopping_list_items
end
