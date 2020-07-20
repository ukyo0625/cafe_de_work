class ApplicationController < ActionController::Base

	private
	def after_sign_in_path_for(resource)
		case resource
		when Admin
		admins_owners_path
		when Owner
		owners_shops_path
		end
	end
end
