class Admins::OwnersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@q = Owner.ransack(params[:q])
		#ransackによるオーナーの名前で検索する機能
	  @owners = @q.result(distinct: true).page(params[:page]).per(10)
	  #ページネーション
	end
	def show
		@owner = Owner.find(params[:id])
		@shops = Shop.where(owner_id: @owner.id)
		#show画面のオーナーのshopのみ表示
	end
	def edit
		 @owner = Owner.find(params[:id])
	end
	def update
		@owner = Owner.find(params[:id])
		if @owner.update(owner_params)
		  redirect_to admins_owner_path(@owner)
		else
		  render :edit
		end
	end

	private
	def search_params
	  params.require(:q).permit(:owner_name_cont)
	end
	def owner_params
		params.require(:owner).permit(:name, :email, :is_actived)
	end
end
