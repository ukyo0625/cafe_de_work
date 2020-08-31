class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :shop_id
      t.integer :station_number

      t.timestamps
    end
  end
end
