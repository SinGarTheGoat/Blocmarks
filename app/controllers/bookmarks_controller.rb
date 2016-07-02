class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    topic = Topic.find(params[:topic_id])
    @bookmark = topic.bookmarks.find(params[:id])
  end

  def update
    topic = Topic.find(params[:topic_id])
    @bookmark = topic.bookmarks.find(params[:id])
    if @bookmark.update(bookmark_params)
      flash[:notice] = 'bookmark was saved successfully.'
      redirect_to topic
    else
      flash.now[:alert] = @bookmark.errors.full_messages.first
      render :edit
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    # @bookmark.user = current_user
    # @new_bookmark = Bookmark.new
    if @bookmark.save
      flash[:notice] = 'bookmark was saved successfully.'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error creating bookmark. Please try again.'
      render :new
    end
  end
    def destroy
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.find(params[:id])
      if @bookmark.destroy
        flash[:notice] = "\"#{@bookmark}\" was deleted successfully."
        redirect_to @topic

      else
        flash.now[:alert] = 'There was an error deleting the post.'
        render :show
      end
     end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
