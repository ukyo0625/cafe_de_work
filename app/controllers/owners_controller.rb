class OwnersController < ApplicationController
	before_action :authenticate_owner!
	def leave
		@owner = Owner.find(current_owner.id)
		@owner.destroy
	    redirect_to root_path
	end
	def edit
	    @owner = Owner.find(params[:id])
	end
	def update
		@owner = Owner.find(params[:id])
		if @owner.update(owner_params)
		   redirect_to owners_shops_path
		else
		   render :edit
		end
	end

	private

  	def owner_params
      params.require(:owner).permit(:email, :name)
  	end
end
