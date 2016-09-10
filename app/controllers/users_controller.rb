class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
	end

  def new_request
    if current_user.address.blank?
      redirect_to :action => 'add_address'
    else
      request_added = Request.add_new_request(params, current_user)
      render :index
    end
    
  end

  def add_address
    @nil_address = 1
    current_user.update(address: params["address"])
  end
end
