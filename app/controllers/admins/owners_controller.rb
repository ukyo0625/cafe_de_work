class OwnersController < ApplicationController
	before_action :authenticate_admin!
end
