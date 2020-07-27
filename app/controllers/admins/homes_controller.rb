class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
		@shops = Shop.all
		@shop_favorite = @shops.where(is_favorite: true).where(is_active: true)
		@shop_favorite_odd = @shop_favorite.each_slice(2).map(&:first)
		@shop_favorite_even = @shop_favorite.each_slice(2).map(&:last)
	end
end
