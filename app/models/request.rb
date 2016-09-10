class Request < ActiveRecord::Base
  belongs_to :user
  has_one :prescription

  MEDICINE_TYPE ={
    antibiotics: 1,
    pathogens: 2,
    antipyretics: 3,
    analgesics: 4,
    tranquilizer: 5,
    antiseptics: 6
  }

  def self.add_new_request(params, current_user)
  end
end