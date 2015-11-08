# Blocmarks, 4. Receive Incoming Emails
class IncomingController < ApplicationController
    # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        # Take a look at these in your server Logs to get a sense with what you're dealing with.
        # puts "INCOMING PARAMS HERE: #{params}"
        
        # You put the message-splitting and business magic here.
        # Find the user by using params[:sender]
        @user = User.find_by(email: params[:sender])
        create_user unless @user
        
        # Find the topic by using params[:subject]
        @topic = @user.topics.find_by(title: params[:subject])
        create_topic unless @topic
        
        # Assign the url to a variable after retreiving it from params["body-plain"]
        url = params['body-plain'].strip
        @bookmark = @topic.bookmarks.new(url: url)
        @bookmark.save
        head 200
    end

    private
    
    def create_user
        @user = User.new(email: params[:sender], password: params[:sender])
        @user.skip_confirmation!
        @user.save!(validate: false)
    end
    
    def create_topic
        @topic = Topic.new(title: params[:subject], user: @user)
        @topic.save!          
    end
end