class FixColumnNameToShops < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shops, :lat, :latitude
  	rename_column :shops, :lon, :longitude
  end
end
