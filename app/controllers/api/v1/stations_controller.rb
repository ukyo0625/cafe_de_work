class Api::V1::StationsController < ApplicationController
        include LineSelect
        def index
        result = line_to_station_select(params[:line])
        render json: {result: result}
        end


end