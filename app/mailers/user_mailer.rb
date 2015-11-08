# Blocmarks, 4. Receive Incoming Emails
class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    def welcome_email(user)
       @user = user
       @url = 'http://example.com/Login'
       mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end