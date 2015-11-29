class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark saved."
      redirect_to @topic
    else
      flash[:error] = "Error: Bookmark not saved."
      render "new"
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
    
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error updating this bookmark. Please try again."
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted." # Add flash messaging to applications.html.erb
      redirect_to @topic
    else
      flash[:error] = "Error: Bookmark not deleted."
      redirect_to @topic
    end
  end
  
  private
  
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end