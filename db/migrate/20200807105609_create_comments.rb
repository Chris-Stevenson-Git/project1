class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :like_count
      t.text :image

      t.timestamps
    end
  end
end
