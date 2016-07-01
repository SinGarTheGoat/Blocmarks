class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    #  @bookmark = Bookmark.find(params[:id])
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

    def destroy
      @topic = Topic.find(params[:post_id])
      @bookmark = Bookmark.find(params[:id])
      if @bookmark.destroy
        flash[:notice] = "\"#{@bookmark}\" was deleted successfully."
        redirect_to @topic

      else
        flash.now[:alert] = 'There was an error deleting the post.'
        render :show
      end
     end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
