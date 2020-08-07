class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.date :timestamp
      t.text :method
      t.integer :likecount
      t.text :image

      t.timestamps
    end
  end
end
