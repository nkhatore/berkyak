class AddAutoDeletedPostsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :auto_deleted_posts, :integer
  end
end
