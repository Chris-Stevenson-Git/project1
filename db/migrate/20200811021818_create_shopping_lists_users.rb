class CreateShoppingListsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_lists_users do |t|
      t.integer :user_id
      t.integer :shopping_list_id
    end
  end
end
