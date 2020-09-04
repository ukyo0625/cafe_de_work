class Api::V1::StationsController < ApplicationController
        include LineSelect
        def index
        result = line_to_station_select(params[:line])
        #concernsから駅名を引っ張ってくる
        render json: {result: result}
        end


end