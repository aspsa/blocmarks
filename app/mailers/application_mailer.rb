# Blocmarks, 4. Receive Incoming Emails
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end