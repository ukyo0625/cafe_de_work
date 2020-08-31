class AddStationColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :stations, :prefecture, :string
  	add_column :stations, :line, :string
  end
end
