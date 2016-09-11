class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    current_user.update(current_sign_in_ip: request.remote_ip) if current_user.address.blank?
    get_available_users_nearby
    @requests = Request.where("user_id in (?) ",@list_of_users)
	end

  def show
    render :index  
  end

  def get_available_users_nearby
    distance = 1000
    center_point = [current_user.latitude, current_user.longitude]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    a = User.within_bounding_box(box)
    users = a.reject{|b| b.id == current_user.id}
    @list_of_users = users.map(&:id)
    [users]
  end

  def new_request
    # add_address if params["address"].present?
    request_added = Request.add_new_request(params, current_user)
    users = get_available_users_nearby
    users.first.each do |u|
      UserMailer.request_notification(u,request_added).deliver_now
    end
    redirect_to :action => 'index'
  end

  def add_address
    current_user.update(address: params["address"])
  end

  def accept_request
    requested_user = User.find params["requested_by"]
    accpeted_user = User.find params["accepted_by"]
    request = Request.find params["request"]
    UserMailer.accept_request_notification(requested_user , accpeted_user, request).deliver_now
    redirect_to :action => 'index'
  end
end
