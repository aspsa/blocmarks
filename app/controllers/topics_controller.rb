class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    
    if @topic.save
      flash[:notice] = "Topic saved."
      redirect_to topics_path
    else
      flash[:error] = "Error: Topic not saved."
      render "new"
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    
    if @topic.update(topic_params)
      flash[:notice] = "Topic updated."
      redirect_to topics_path
    else
      flash[:error] = "Error: Topic not updated."
      render "edit"
    end
  end
  
  def destroy
    @topic = Topic.destroy(params[:id])
    
    if @topic.destroy
      flash[:notice] = "Topic deleted." # Add flash messaging to applications.html.erb
      redirect_to topics_path
    else
      flash[:error] = "Error: Topic not deleted."
      render "index"
    end
  end
  
  private
  
    def topic_params
      params.require(:topic).permit(:title)
    end
end