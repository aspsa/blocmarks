class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.new
    @bookmark = @topic.bookmarks.new
  end

  def edit
  end
end
