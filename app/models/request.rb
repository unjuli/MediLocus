class Request < ActiveRecord::Base
  belongs_to :user
  has_one :prescription
end