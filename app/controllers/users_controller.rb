# Blocmarks, 4. Receiving Incoming Emails
class UsersController < ApplicationController
   # POST /users
   # POST /users.json
   def create
      @user = User.new(params[:user]) 
      
      respond_to do |format|
          if @user.save
             # Tell the UserMailler to send a welcome message after save
             UserMailer.welcome_email(@user).deliver_later
             format.html { redirect_to(@user, notice: 'User was successfully created.') }
             format.json { render json: @user, status: :created, location: @user }
          else
             format.html { render action: 'new' }
             format.json { render json: @user_errors, status: :unprocessable_entity }
          end
      end
   end
   
   def show
      # Populate @user_bookmarks with the user's bookmarks
      @topic = User.topic.find(params[:id])
      @user_bookmarks = @user.topic.bookmarks.find(@user)

      # Populate @Liked_bookmarks with Liked bookmarks
      
   end
end