class TopicsController < ApplicationController
  def index
    query = "SELECT * FROM topics"
    @topics = Topic.find_by_sql(query)
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :index
    end    
  end

  private
  
  def topic_params
    params.require(:topic).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
