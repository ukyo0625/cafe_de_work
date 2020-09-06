class Owners::ShopsController < ApplicationController
	before_action :authenticate_owner!
	def index
		@shops = Shop.where(owner_id: current_owner.id)
		#自分の投稿したカフェを表示
	end
	def show
		@shop = Shop.find(params[:id])
		@tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
		#shopと結びついてるタグを引っ張ってくる
	end
	def new
		@shop_new = Shop.new
		stations = [Station.new, Station.new, Station.new]
		#3駅投稿できるようにフォームを３つ作成
		@shop_new.stations << stations
		@tags = Tag.all
		@holidays_select = []
		@tags_select = []
		@prefecture_options = Shop::PREFECTURE_OPTIONS
	end
	def edit
		@shop = Shop.find(params[:id])
		@tags = Tag.all
		@holidays_select = @shop.holidays.pluck(:holiday_number)
		@tags_select = @shop.shop_tags.pluck(:tag_id)
		@prefecture_options = Shop::PREFECTURE_OPTIONS
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
			@prefecture_options = Shop::PREFECTURE_OPTIONS
			@tags = Tag.all
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
    @shop.stations.delete_all
		if @shop.update(shop_params)
		  redirect_to owners_shop_path(@shop.id)
		else
			@tags = Tag.all
			@holidays_select = @shop.holidays.pluck(:holiday_number)
			@tags_select = @shop.shop_tags.pluck(:tag_id)
			@prefecture_options = Shop::PREFECTURE_OPTIONS
		  render :edit
		end
	end
	private
	  def shop_params
      params.require(:shop).permit(
      	:shop_name,
      	:shop_detail,
      	:owner_id,
      	:address,
      	:seat,
      	:open_time_hour,
        :open_time_minute,
        :close_time_hour,
      	:close_time_minute,
      	:phone_number,
      	:shop_image,
      	:is_favorite,
      	:is_active,
      	:remarks,
      	stations_attributes: [
      		:prefecture,
      		:line,
      		:station_name
      	]
      )
	  end
	  def holiday_tag_params
	      params.require(:shop).permit(holiday: [],tag: [])
	  end
end
