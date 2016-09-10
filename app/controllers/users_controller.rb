class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    @requests = Request.where.not(user_id: current_user.id)
	end

  def new_request
    add_address if params["address"].present?
    request_added = Request.add_new_request(params, current_user)
    redirect_to :action => 'index'
  end

  def add_address
    current_user.update(address: params["address"])
  end
end
