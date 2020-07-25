class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
    	t.string    :shop_name,       null: false
    	t.text    :shop_detail,       null: false
    	t.integer    :owner_id,       null: false
    	t.string      :address,       null: false
    	t.integer        :seat,       null: false
    	t.string    :open_time,       null: false
    	t.string   :close_time,       null: false
    	t.string :phone_number,       null: false
    	t.boolean :is_favorite,       null: false, default: false
    	t.boolean   :is_active,       null: false, default: true

      t.timestamps
    end
  end
end
