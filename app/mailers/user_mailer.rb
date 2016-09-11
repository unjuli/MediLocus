class UserMailer < ApplicationMailer


	def request_notification(user, request)
		@request = request
		@user = user
		mail(to: @user.email, subject: "New Medical request in your vicinity!")
	end

  def accept_request_notification( requested_user, accepted_user, request)
    @request = request
    @requested_user = requested_user 
    @accepted_user = accepted_user
    mail(to: @requested_user.email, subject: "Congratulations, #{@accepted_user.name} is going to offer you medicine!")
  end
end
