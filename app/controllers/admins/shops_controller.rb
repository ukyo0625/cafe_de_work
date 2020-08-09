class Admins::ShopsController < ApplicationController
	before_action :authenticate_admin!
	def show
        @shop = Shop.find(params[:id])
        @tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
	end
	def edit
		@shop = Shop.find(params[:id])
		@tags = Tag.all
		@holidays_select = @shop.holidays.pluck(:holiday_number)
		@tags_select = @shop.shop_tags.pluck(:tag_id)
	end
    def update
		@shop = Shop.find(params[:id])
		@shop.holidays = []
		@shop.shop_tags.destroy_all
		unless holiday_tag_params[:holiday].blank?
		    holiday_tag_params[:holiday].each do |holiday_number|
		       @shop.holidays.build(holiday_number: holiday_number)
		    end
	    end
	    unless holiday_tag_params[:tag].blank?
	        holiday_tag_params[:tag].each do |tag_id|
		        @shop.shop_tags.build(tag_id: tag_id)
		    end
	    end
		if @shop.update(shop_params)
		   redirect_to admins_shop_path(@shop.id)
		else
			@tags = Tag.all
			@holidays_select = @shop.holidays.pluck(:holiday_number)
			@tags_select = @shop.shop_tags.pluck(:tag_id)
		   render :edit
		end
	end
	def search
        @q = Shop.ransack(params[:q])
	end
	def index
	    param_shop_tag_ids = params[:q][:shop_tags_tag_id_in_any].presence && params[:q][:shop_tags_tag_id_in_any].map(&:to_i)
		params[:q].delete(:shop_tags_tag_id_in_any)
	    @q = Shop.search(search_params)
	    shops = @q.result(distinct: true).where(is_active: true)
	    if param_shop_tag_ids.present?
	       shop_tags = shops.select do |shop|
	            target_shop_tag_ids = shop.shop_tags.map(&:tag_id)
	            param_shop_tag_ids.all? {|i| target_shop_tag_ids.include?(i)}
	       end
	       @shops = Kaminari.paginate_array(shop_tags).page(params[:page]).per(10)
	    else
	       @shops = shops.page(params[:page]).per(10)
	    end
	end
	private
	def shop_params
	    params.require(:shop).permit(:shop_name, :shop_detail, :owner_id, :address, :seat, :open_time, :close_time, :phone_number, :shop_image, :is_favorite , :is_active)
	end
	def holiday_tag_params
	      params.require(:shop).permit(holiday: [],tag: [])
	end
	def search_params
	    params.require(:q).permit(:shop_name_or_shop_detail_cont, holidays_holiday_number_not_in: [], shop_tags_tag_id_in_any: [])
	end
end
