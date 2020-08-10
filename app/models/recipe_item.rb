class RecipeItem < ApplicationRecord
  has_many :ingredients
  belongs_to :recipe, optional: true
end
