class AddShopImageIdToShops < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :shop_image_id, :string
  end
end
