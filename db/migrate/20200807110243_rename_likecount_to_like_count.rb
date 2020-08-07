class RenameLikecountToLikeCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :likecount, :like_count
  end
end
