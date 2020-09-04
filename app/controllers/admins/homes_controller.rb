class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
		@shops = Shop.all
		@shop_favorite = @shops.where(is_favorite: true).where(is_active: true)
    #有効なshopからお気に入りに含んでるshopのみ
		@shop_favorite_odd = @shop_favorite.each_slice(2).map(&:first)
		@shop_favorite_even = @shop_favorite.each_slice(2).map(&:last)
    #縦2列に表示するためにsliceで分割
	end
end
