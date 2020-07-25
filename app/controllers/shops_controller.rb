class ShopsController < ApplicationController

	def top
	end

	def search
        @q = Shop.ransack(params[:q])
        @shops = @q.result(distinct: true)
	end

	def index
	    @q = Shop.search(search_params)
	    @shops = @q.result(distinct: true)
	end

	private
	def search_params
	    params.require(:q).permit(:shop_name_or_shop_detail_cont, :holiday_number_eq_any)
	end
end
