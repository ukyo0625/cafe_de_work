class ShopsController < ApplicationController

	def top
		@shops = Shop.all
		@shop_favorite = @shops.where(is_favorite: true)
	end

	def search
        @q = Shop.ransack(params[:q])
        @shops = @q.result(distinct: true)
	end

	def index
	    @q = Shop.search(search_params)
	    @shops = @q.result(distinct: true).where(is_active: true).page(params[:page]).per(10)
	end
	def show
		@shop = Shop.find(params[:id])
		@tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
	end

	private
	def search_params
	    params.require(:q).permit(:shop_name_or_shop_detail_cont, holidays_holiday_number_not_in: [], shop_tags_tag_id_in_any: [])
	end
end
