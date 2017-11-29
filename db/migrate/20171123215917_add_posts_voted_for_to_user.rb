class AddPostsVotedForToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :posts_voted_for, :integer
  end
end
