class Shop < ApplicationRecord
	attachment :shop_image
	has_many :holidays
	has_many :shop_tags

	validates :shop_name,presence: true
	validates :shop_name,    length: { in: 1..20 }
	validates :shop_detail,presence: true
	validates :shop_detail,    length: { in: 1..120 }
	validates :address,presence: true
	validates :seat,presence: true
	validates :seat, numericality: true
	validates :open_time,presence: true
	validates :open_time, numericality: true
	validates :close_time,presence: true
	validates :close_time, numericality: true
	validates :phone_number,presence: true
	validates :phone_number, numericality: true

end