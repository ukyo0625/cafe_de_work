class ShopsController < ApplicationController

	def top
		@actived_shops = Shop.owner_actived
    @shop_favorites = @actived_shops.active.with_favorite
    #有効なshopからお気に入りに含んでるshopのみ
    @shop_favorite_odd = @shop_favorites.each_slice(2).map(&:first)
    @shop_favorite_even = @shop_favorites.each_slice(2).map(&:second).compact
    #縦2列に表示するためにsliceで分割
	end

	def search
    @q = Shop.ransack(params[:q])
    @prefecture_options = Shop::PREFECTURE_OPTIONS
	end

	def index
    @actived_shops = Shop.owner_actived
		param_shop_tag_ids = params[:q][:shop_tags_tag_id_in_any].presence && params[:q][:shop_tags_tag_id_in_any].map(&:to_i)
		params[:q].delete(:shop_tags_tag_id_in_any)
	  @q = @actived_shops.search(search_params)
	  shops = @q.result(distinct: true).active
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
