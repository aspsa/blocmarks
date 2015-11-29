# Blocmarks, 4. Receive Incoming Emails
=begin
ActionMailer::Base.smtp_settings = {
    port:                   587,
    address:                'smtp.mailgun.org',
    user_name:              ENV['MAILGUN_SMTP_LOGIN'],
    password:               ENV['MAILGUN_SMTP_PASSWORD'],
    domain:                 Appc2e7d05376dd4de68ecb3a39b7e42061.Mailgun.Org,
    authentication:         :plain,
    content_type:           'text/html'
}

ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure than Local mail only emails you.
# # http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails

class DevelopmentMailInterceptor
    def self.delivering_email(message)
        message.to = 'aspsamailgun@gmail.com',
        message.cc = nil
        message.bcc = nil
    end
end

# Locally, outgoing email will be intercepted by the above DevelopmentMailInterceptor before going out.
if Rails.env.development?
    ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
=end