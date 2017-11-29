class AddVotesToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :votes, :integer
  end
end
