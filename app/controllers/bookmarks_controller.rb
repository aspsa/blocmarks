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
    @bookmark = Bookmark.new(bookmark_params)
    
    if @bookmork.save
      flash[:notice] = "Bookmark saved."
      redirect_to topics_path
    else
      flash[:error] = "Error: Bookmark not saved."
      render "new"
    end
  end

  def edit
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  private
  
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end