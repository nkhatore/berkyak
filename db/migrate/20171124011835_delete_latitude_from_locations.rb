class DeleteLatitudeFromLocations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :locations, :latitude
  end
end
