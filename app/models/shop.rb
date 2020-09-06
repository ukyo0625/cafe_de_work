class Shop < ApplicationRecord
	attachment :shop_image
	has_many :holidays
	has_many :shop_tags
	has_many :stations
	belongs_to :owner
	accepts_nested_attributes_for :stations

  PREFECTURE_OPTIONS = [['東京都', '01000'],['埼玉県', '02000'],['神奈川県', '03000'],['千葉県', '04000'],['群馬県', '05000'],['栃木県', '06000'],['茨城県', '07000']]

	validates :shop_name,presence: true
	validates :shop_name,    length: { in: 1..20 }
	validates :shop_detail,presence: true
	validates :shop_detail,    length: { in: 1..120 }
	validates :address,presence: true
	validates :seat,presence: true
	validates :seat, numericality: { only_integer: true }
	validates :open_time_hour, presence: true
	validates :open_time_hour, numericality: { only_integer: true }
	validates :open_time_hour, inclusion: { in: 0..23 }
	validates :close_time_hour, presence: true
	validates :close_time_hour, numericality: { only_integer: true }
	validates :close_time_hour, inclusion: { in: 0..23 }
	validates :open_time_minute,presence: true
	validates :open_time_minute, numericality: { only_integer: true }
	validates :open_time_minute, inclusion: { in: 0..59 }
	validates :close_time_minute,presence: true
	validates :close_time_minute, numericality: { only_integer: true }
	validates :close_time_minute, inclusion: { in: 0..59 }
	validates :phone_number,presence: true
	validates :phone_number, numericality: true
	validates :remarks,    length: { in: 0..30 }


  scope :active, -> {where(is_active: true)}
  scope :with_favorite, -> {where(is_favorite: true)}
  scope :owner_actived, -> {where(owner_id: [Owner.all.actived.select("owners.id")])}
  #activedはownerモデルにscopeで定義
end
