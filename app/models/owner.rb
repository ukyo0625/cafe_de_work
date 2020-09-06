class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,presence: true
  has_many :shops, :dependent => :destroy

  scope :actived, -> {where(is_actived: true)}
  #shopモデルで使用
end
