class RecipeItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe, optional: true

end
