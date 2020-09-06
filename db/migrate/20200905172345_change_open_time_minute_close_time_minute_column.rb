class ChangeOpenTimeMinuteCloseTimeMinuteColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :open_time_minute, :string, null: false
    change_column :shops, :close_time_minute, :string, null: false
  end
end
