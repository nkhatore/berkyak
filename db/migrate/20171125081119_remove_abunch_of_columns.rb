class RemoveAbunchOfColumns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :comments, :upvotes_received
  	remove_column :comments, :downvotes_received
  	remove_column :comments, :upvotes_received



  end
end
