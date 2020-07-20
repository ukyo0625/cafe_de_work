class Shop < ApplicationRecord
	attachment :shop_image
	has_many :holidays

	# geocoded_by :address
 #    after_validation :geocode, if: :address_changed?

	# before_save :save_coordinates

	# private

	# def save_coordinates
	# 	result = Geocoder.search(address).first
	# 	self.latitude, self.longitude = result.coordinates
	# end
end
