class Admins::ShopsController < ApplicationController
	before_action :authenticate_admin!
	def show
    @shop = Shop.find(params[:id])
    @tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
    #shopと結びついてるタグを引っ張ってくる
	end
	def edit
		@shop = Shop.find(params[:id])
		@tags = Tag.all
		@holidays_select = @shop.holidays.pluck(:holiday_number)
		#登録してる定休日を引っ張ってくる
		@tags_select = @shop.shop_tags.pluck(:tag_id)
		#登録してるタグを引っ張ってくる
		@prefecture_options = [['東京都', '01000'],['埼玉県', '02000'],['神奈川県', '03000'],['千葉県', '04000'],['群馬県', '05000'],['栃木県', '06000'],['茨城県', '07000']]
		#都道府県のセレクトボックスに入れる
	end
    def update
			@shop = Shop.find(params[:id])
			@shop.holidays = []
			@shop.shop_tags.destroy_all
			#タグが重複して増えないようにupdate前にカラムを空にする
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
	    #駅名が重複して増えないようにupdate前にカラムを空にする
		if @shop.update(shop_params)
		  redirect_to admins_shop_path(@shop.id)
		else
			@tags = Tag.all
			@holidays_select = @shop.holidays.pluck(:holiday_number)
			@tags_select = @shop.shop_tags.pluck(:tag_id)[['東京都', '01000'],['埼玉県', '02000'],['神奈川県', '03000'],['千葉県', '04000'],['群馬県', '05000'],['栃木県', '06000'],['茨城県', '07000']][['東京都', '01000'],['埼玉県', '02000']]
		  render :edit
		end
	end
	def search
    @q = Shop.ransack(params[:q])
    #ransackの検索機能
    @prefecture_options = [['東京都', '01000'],['埼玉県', '02000'],['神奈川県', '03000'],['千葉県', '04000'],['群馬県', '05000'],['栃木県', '06000'],['茨城県', '07000']]
    #都道府県のセレクトボックスに入れる
	end
	def index
	  param_shop_tag_ids = params[:q][:shop_tags_tag_id_in_any].presence && params[:q][:shop_tags_tag_id_in_any].map(&:to_i)
		params[:q].delete(:shop_tags_tag_id_in_any)
		#deleteで検索対象を一旦消す
	  @q = Shop.search(search_params)
	  shops = @q.result(distinct: true).where(is_active: true)
	  if param_shop_tag_ids.present?
	    shop_tags = shops.select do |shop|
	      target_shop_tag_ids = shop.shop_tags.map(&:tag_id)
	      param_shop_tag_ids.all? {|i| target_shop_tag_ids.include?(i)}
	    end
	    #チェックボックスで選択したタグを全て含むshopを表示
	    @shops = Kaminari.paginate_array(shop_tags).page(params[:page]).per(10)
	  else
	    @shops = shops.page(params[:page]).per(10)
	    #ページネーション
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
    	:open_time,
    	:close_time,
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
	def search_params
	  params.require(:q).permit(:shop_name_or_shop_detail_cont, :stations_station_name_cont ,holidays_holiday_number_not_in: [])
	end
end
