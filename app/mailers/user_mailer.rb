class UserMailer < ApplicationMailer


	def request_notification(user, request)
		@request = request
		@user = user
		mail(to: @user.email, subject: 'New Medical request in your vicinity!')
	end
end
