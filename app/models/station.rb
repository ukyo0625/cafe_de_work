class Station < ApplicationRecord
	belongs_to :shop
  before_save :edit_new_station
  def edit_new_station
    if self.station_name == "駅　　名"
      self.station_name = ""
      self.line = ""
      self.prefecture = ""
    end
  end
end
