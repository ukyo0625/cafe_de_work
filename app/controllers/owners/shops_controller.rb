class Owners::ShopsController < ApplicationController
	def index
		@shops = Shop.where(owner_id: current_owner.id)
	end
	def show
		@shop = Shop.find(params[:id])
	end
	def new
		@shop_new = Shop.new
	end
	def edit
	end
	def create
		shop_new = Shop.new(shop_params)
		shop_new.owner_id = current_owner.id
        params[:shop][:holiday].each do |holiday_number|
		    shop_new.holidays.build(holiday_number: holiday_number)
	    end
		if shop_new.save!
		 redirect_to owners_shop_path(shop_new.id)
	    else
	     render :new
	    end
	end
	def update
	end
	def status
	end

	private
	  def shop_params
	      params.require(:shop).permit(:shop_name, :shop_detail, :owner_id, :address, :seat, :open_time, :close_time, :phone_number, :shop_image, :is_favorite , :is_active, :latitude, :longitude, :coordinates)
	  end
end
