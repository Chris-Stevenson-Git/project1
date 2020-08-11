class CreateRecipeItemsShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_items_shopping_lists do |t|
      t.integer :recipe_item_id
      t.integer :shopping_list_id
    end
  end
end
