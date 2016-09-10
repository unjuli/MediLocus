class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    get_available_users
    @requests = Request.where("user_id in (?) ",@list_of_users)
	end

  def get_available_users
    distance = 1000
    center_point = [current_user.latitude, current_user.longitude]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    a = User.within_bounding_box(box)
    users = a.reject{|b| b.id == current_user.id}
    @list_of_users = users.map(&:id)
  end

  def new_request
    current_user.update(current_sign_in_ip: request.remote_ip) if current_user.address.blank?
    
    # add_address if params["address"].present?
    # request_added = Request.add_new_request(params, current_user)
    redirect_to :action => 'index'
  end

  def add_address
    current_user.update(address: params["address"])
  end
end
