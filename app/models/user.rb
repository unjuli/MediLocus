class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :current_sign_in_ip
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  ROLE_ENUM = {
    user: 1,
    chemist: 2
  }

  has_many :biddings
  has_many :requests
end
