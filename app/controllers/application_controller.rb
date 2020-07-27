class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	private
	def after_sign_in_path_for(resource)
		case resource
		when Admin
		admins_top_path
		when Owner
		owners_shops_path
		end
	end

	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
end
