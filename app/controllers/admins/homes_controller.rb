class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
		@shops = Shop.all
		@shop_favorite = @shops.where(is_favorite: true)
	end
end
