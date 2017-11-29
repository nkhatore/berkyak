class Changepostsvotedfortotext < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :posts_voted_for, :text

  end
end
