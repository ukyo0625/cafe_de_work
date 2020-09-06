class RenameOpenTimeCloseTimeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :open_time, :open_time_hour
    rename_column :shops, :close_time, :close_time_hour
  end
end
