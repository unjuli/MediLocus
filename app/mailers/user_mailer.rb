class UserMailer < ApplicationMailer


	def request_notification(user, request_added)
		@request_added = request_added
		@user = user
		mail(to: @user.email, subject: "New Medical request in your vicinity!")
	end

  def accept_request_notification(current_user, user, request)
    @request = request
    @user = user
    @current_user = current_user
    mail(to: @current_user.email, subject: "Congratulations, #{@user.name} is going to offer you medicine!")
  end
end
