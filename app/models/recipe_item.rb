class RecipeItem < ApplicationRecord
  belongs_to :ingredient, optional: true
  belongs_to :recipe, optional: true

end
