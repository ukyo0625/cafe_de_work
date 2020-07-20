class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.integer :shop_id
      t.integer :holiday_number

      t.timestamps
    end
  end
end
