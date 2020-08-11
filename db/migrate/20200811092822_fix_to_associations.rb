class FixToAssociations < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :recipe_item_id
    add_column :recipe_items, :ingredient_id, :integer
    add_column :shopping_list_items, :ingredient_id, :integer
  end
end
