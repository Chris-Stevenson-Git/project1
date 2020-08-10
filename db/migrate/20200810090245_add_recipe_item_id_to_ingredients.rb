class AddRecipeItemIdToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :recipe_item_id, :integer
  end
end
