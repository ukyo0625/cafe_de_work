class Owners::ShopsController < ApplicationController
	before_action :authenticate_owner!
	def index
		@shops = Shop.where(owner_id: current_owner.id)
	end
	def show
		@shop = Shop.find(params[:id])
		@tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
	end
	def new
		@shop_new = Shop.new
		@tags = Tag.all
		@holidays_select = []
		@tags_select = []
	end
	def edit
		@shop = Shop.find(params[:id])
		@tags = Tag.all
		@holidays_select = @shop.holidays.pluck(:holiday_number)
		@tags_select = @shop.shop_tags.pluck(:tag_id)
	end
	def create
		@shop_new = Shop.new(shop_params)
		@holidays_select = holiday_tag_params[:holiday].present? ? holiday_tag_params[:holiday] : []
		@tags_select = holiday_tag_params[:tag].present? ? holiday_tag_params[:tag] : []
		@shop_new.owner_id = current_owner.id
		unless @holidays_select.blank?
		    @holidays_select.each do |holiday_number|
		       @shop_new.holidays.build(holiday_number: holiday_number)
		    end
	    end
	    unless @tags_select.blank?
	        @tags_select.each do |tag_id|
		        @shop_new.shop_tags.build(tag_id: tag_id)
		    end
	    end
		if @shop_new.save
		   redirect_to owners_shop_path(@shop_new.id)
	    else
	       @tags = Tag.all
			@holidays_select = @shop.holidays.pluck(:holiday_number)
			@tags_select = @shop.shop_tags.pluck(:tag_id)
	       render :new
	    end
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
		   redirect_to owners_shop_path(@shop.id)
		else
		   render :edit
		end
	end
	def status
	end

	private
	  def shop_params
	      params.require(:shop).permit(:shop_name, :shop_detail, :owner_id, :address, :seat, :open_time, :close_time, :phone_number, :shop_image, :is_favorite , :is_active)
	  end
	  def holiday_tag_params
	      params.require(:shop).permit(holiday: [],tag: [])
	  end
end
