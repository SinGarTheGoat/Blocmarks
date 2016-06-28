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

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  def create
    @topic = Topic.new(topic_params)
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
