class ChangeTypeChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :open_time_hour, :integer
    change_column :shops, :close_time_hour, :integer
    change_column :shops, :open_time_minute, :integer
    change_column :shops, :close_time_minute, :integer
  end
end
