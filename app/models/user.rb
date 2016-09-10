class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
	after_validation :geocode, if: Proc.new {|user| user.address.present? and user.address_changed? }
end
