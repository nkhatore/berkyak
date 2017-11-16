class AddUpvotesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :upvotes_received, :integer
    add_column :users, :posts_made, :integer

  end
end
