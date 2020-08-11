class AddUnitToRecipeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_items, :unit, :text
  end
end
