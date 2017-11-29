class AddPostsDownvotedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :posts_downvoted, :text
  end
end
