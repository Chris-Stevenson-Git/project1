class FixAssociationsInRecipeItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipe_items, :ingredient_id, :recipe_id
  end
end
