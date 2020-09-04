class Api::V1::LinesController < ApplicationController
	include LineSelect
	def index
    result = prefecture_to_line_select(params[:pref])
    #concernsから路線を引っ張ってくる
    render json: {result: result}
	end
end