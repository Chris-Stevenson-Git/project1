class Ingredient < ApplicationRecord
  belongs_to :recipe_item, optional: true
end
