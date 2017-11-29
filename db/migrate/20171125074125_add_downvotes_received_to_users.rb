class AddDownvotesReceivedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :downvotes_received, :integer
  end
end
