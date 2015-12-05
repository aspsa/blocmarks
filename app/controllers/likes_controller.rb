# Blocmarks, 8. Like and Unlike Bookmarks
class LikesController < ApplicationController
=begin
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save
      # Add code to generate a success flash and redirect to @bookmark
      flash[:notice] = "This like was successfully saved."
      redirect_to topic
    else
      # Add code to generate a failure flash and redirect to @bookmark
      flash[:error] = "This like was not successfully saved."
      redirect_to topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    
    if like.destroy
      # Flash success and redirect to @bookmark
      flash[:notice] = "This like was successfully destroyed (i.e., was successfully unliked)"
    else
      # Flash error and redirect to @bookmark
      flash[:error] = "This like was not succcessfully destroyed (i.e., was not successfully unliked)"
    end
  end
=end
end