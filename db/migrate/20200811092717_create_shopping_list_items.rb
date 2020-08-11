class CreateShoppingListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_list_items do |t|
      t.integer :shopping_list_id
      t.integer :quantity
      t.text :unit

      t.timestamps
    end
  end
end
