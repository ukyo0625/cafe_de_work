class ShopsController < ApplicationController
	def index
		@shops = Shop.all
	end
	def show
	end
	def new
	end
	def edit
	end
	def create
	end
	def update
	end
	def status
	end

	private
	  def shop_params
	      params.require(:shop).permit(:shop_name, :shop_detail, :owner_id, :address, :seat, :open_time, :close_time, :holiday, :phone_number, :is_favorite , :is_active)
	  end
end
