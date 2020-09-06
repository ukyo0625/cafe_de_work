class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
    @actived_shops = Shop.owner_actived
		@shop_favorites = @actived_shops.active.with_favorite
    #有効なshopからお気に入りに含んでるshopのみ
		@shop_favorite_odd = @shop_favorites.each_slice(2).map(&:first)
		@shop_favorite_even = @shop_favorites.each_slice(2).map(&:second).compact
    #縦2列に表示するためにsliceで分割
	end
end
