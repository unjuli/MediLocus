class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@medilocus.com"
  layout 'mailer'
end
