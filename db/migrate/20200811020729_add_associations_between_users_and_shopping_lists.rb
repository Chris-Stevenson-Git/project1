class AddAssociationsBetweenUsersAndShoppingLists < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shopping_list_id, :integer
    add_column :shopping_lists, :user_id, :integer
  end
end
