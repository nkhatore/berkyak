class AddUpvotesReceivedAndDownvotesReceivedToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :upvotes_received, :integer
    add_column :comments, :downvotes_received, :integer
  end
end
