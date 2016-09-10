class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
	end

  def new_request
    request_added = Request.add_new_request(params, current_user)
    render :index
  end
end
