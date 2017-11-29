class DeleteLongitudeFromLocations < ActiveRecord::Migration[5.1]
  def change
  	  remove_column :locations, :longitude

  end
end
