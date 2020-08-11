class ShoppingListItem < ApplicationRecord
  belongs_to :ingredient, optional: true
  belongs_to :shopping_list, optional: true
end
