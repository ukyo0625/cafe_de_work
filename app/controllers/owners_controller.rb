class OwnersController < ApplicationController
	def leave
	  @owner = Owner.find(current_owner.id)
	  @owner.destroy
      redirect_to root_path
	end
	def edit
	end
end
