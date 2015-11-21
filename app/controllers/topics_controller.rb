class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @user = current_user
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      redirect_to action: "index"
    else
      render "new"
    end
  end
  
  def edit
    @topic = Topic.new(topic_params)
  end
  
  def update
    @topic = Topic.new(topic_params)
    
    if @topic.update
      redirect_to action: "index"
    else
      render "new"
    end
  end
  
  def destroy
    @user = current_user
    @topic = Topic.destroy(params[:id])
  end
  
  private
  
    def topic_params
      params.require(:topic).permit(:title)
    end
end