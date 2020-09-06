class ChangeStationColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :stations, :station_number, :string
  	rename_column :stations, :station_number, :station_name
  end
end
