class AddOpenTimeMinuteCloseTimeMinuteColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :open_time_minute, :string
    add_column :shops, :close_time_minute, :string
  end
end
