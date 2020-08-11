class RecipeItem < ApplicationRecord
  has_many :ingredients
  belongs_to :recipe, optional: true
  has_and_belongs_to_many :shopping_lists

end
