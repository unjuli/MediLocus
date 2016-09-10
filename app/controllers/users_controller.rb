class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    # @requests = Request.where.not(user_id: current_user.id)
	end

  def new_request
    current_user.update(current_sign_in_ip: request.remote_ip) if current_user.address.blank?
    distance = 10
    center_point = [current_user.latitude, current_user.longitude]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    a = User.within_bounding_box(box)
    @list_of_users = a.reject{|b| b.id == current_user.id}
    #add_address if params["address"].present?
    request_added = Request.add_new_request(params, current_user)
    redirect_to :action => 'index'
  end

  def add_address
    current_user.update(address: params["address"])
  end
end
