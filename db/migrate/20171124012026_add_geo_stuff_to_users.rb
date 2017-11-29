class AddGeoStuffToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :lat, :float
  	add_column :users, :long, :float
  	add_column :users, :city, :string
  	add_column :users, :ip_address, :string
  end
end
