class RemoveTimestampFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :timestamp, :date
  end
end
