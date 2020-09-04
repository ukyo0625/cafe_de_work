class ShopsController < ApplicationController

	def top
		@shops = Shop.all
		@shop_favorite = @shops.where(is_favorite: true).where(is_active: true)
		@shop_favorite_odd = @shop_favorite.each_slice(2).map(&:first)
		@shop_favorite_even = @shop_favorite.each_slice(2).map(&:last)
	end

	def search
    @q = Shop.ransack(params[:q])
    @prefecture_options = [['東京都', '01000'],['埼玉県', '02000'],['神奈川県', '03000'],['千葉県', '04000'],['群馬県', '05000'],['栃木県', '06000'],['茨城県', '07000']]
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
	def show
		@shop = Shop.find(params[:id])
		@tag = Tag.find(@shop.shop_tags.pluck(:tag_id))
	end

	private
	def search_params
	  params.require(:q).permit(:shop_name_or_shop_detail_cont, :stations_station_name_cont ,holidays_holiday_number_not_in: [])
	end
end
