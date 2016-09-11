class Request < ActiveRecord::Base
  belongs_to :user
  has_one :prescription
  has_many :biddings

  default_scope { where(solved: false)}

  MEDICINE_TYPE ={
    antibiotics: 1,
    pathogens: 2,
    antipyretics: 3,
    analgesics: 4,
    tranquilizer: 5,
    antiseptics: 6
  }
  MEDICINE_TYPE_INVERT = MEDICINE_TYPE.invert

  def self.add_new_request(params, current_user)
    file = params["prescription"].tempfile
    p = Prescription.create(user_id: current_user.id, file_name: file)
    r = Request.create(user_id: current_user.id, medicine_type: params["medicine"], medicine_detail: params["details"])
    p.update(request_id: r.id)
    r.update(prescription_id: p.id)
    r
    # UserMailer.request_notification(current_user, r).deliver
  end
end