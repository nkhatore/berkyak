class ChangePostsColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :posts_voted_for, :posts_upvoted

  end
end
