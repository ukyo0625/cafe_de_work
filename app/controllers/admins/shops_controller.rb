class Admins::ShopsController < ApplicationController
	before_action :authenticate_admin!
end
