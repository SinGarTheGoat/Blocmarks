class TopicsController < ApplicationController
  before_action :authenticate_user!, :except => ["show", "index"]
  def index
    @topics = Topic.all
    authorize(@topics)
  end

  def show
    @topic = Topic.find(params[:id])
    authorize(@topic)
  end

  def new
    @topic = Topic.new
    authorize(@topic)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    authorize(@topic)
    redirect_to topics_path
  end

  def create
    @topic = Topic.new(topic_params)
    authorize(@topic)
    if @topic.save
      flash[:notice] = 'Topic was saved successfully.'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error creating topic. Please try again.'
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
