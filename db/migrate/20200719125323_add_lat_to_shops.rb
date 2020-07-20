class AddLatToShops < ActiveRecord::Migration[5.2]
  def change
  	 add_column :shops, :lat, :float
     add_column :shops, :lon, :float
  end
end
