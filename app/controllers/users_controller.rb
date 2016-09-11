class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    current_user.update(current_sign_in_ip: request.remote_ip) if current_user.address.blank?
    get_available_users_nearby
    @requests = Request.where("user_id in (?)",@list_of_users)
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
    flash[:notice] = "Request submitted and broadcasted successfully"
    redirect_to :action => 'index'
  end

  def add_address
    current_user.update(address: params["address"])
  end

  def add_bidding_value
  end

  def applied_requests
    @applied_requests = Request.where(user_id: current_user.id)
  end

  def place_bid
    amount = params["amount"]
    delivery_time = Time.zone.now + case params["delivery_time"]
    when "1"
      15.minutes
    when "2"
      30.minutes
    when "3"
      1.hour
    when "4"
      2.hours
    when "5"
      1.day
    end
    Bidding.create(user_id: current_user.id, request_id: params["request"].to_i, amount: amount, delivery_time: delivery_time)
    flash[:notice] = "Bidding details submitted successfully"
    redirect_to :action => 'index'
  end

  def biddings_available
    @biddings_available = []
    current_user.requests.each do |r|
      if r.biddings.present?
        r.biddings.each do |r1|
          @biddings_available << r1
        end
      end
    end
  end

  def accept_bidding_value
    r = Request.find params["request"].to_i
    u = User.find params["solved_by"]
    r.update(solved: 1, solved_by: u.id)
    UserMailer.accept_request_notification(current_user, u, r).deliver_now
    render :biddings_available
  end
end
