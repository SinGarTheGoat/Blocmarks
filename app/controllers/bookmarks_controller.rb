class BookmarksController < ApplicationController
before_action :authenticate_user!, :except => ["show", "index"]
    def show
        @bookmark = Bookmark.find(params[:id])
        authorize(@bookmark)
    end

    def new
        @topic = Topic.find(params[:topic_id])
        @bookmark = Bookmark.new
        authorize(@bookmark)
    end

    def edit
          @topic = Topic.find(params[:topic_id])
          @bookmark = @topic.bookmarks.find(params[:id])
          authorize(@bookmark)

    end

    def update
        topic = Topic.find(params[:topic_id])
        @bookmark = topic.bookmarks.find(params[:id])
        authorize(@bookmark)
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
        @bookmark.user = current_user
        authorize(@bookmark)
        if @bookmark.save
            flash[:notice] = 'bookmark was saved successfully.'
            redirect_to @topic
        else
            flash.now[:alert] = 'Error creating bookmark. Please try again.'
            render :new
        end
    end

    def destroy
        topic = Topic.find(params[:topic_id])
        bookmark = Bookmark.find(params[:id])
        authorize(bookmark)
        if bookmark.destroy
            flash[:notice] = "\"#{bookmark.url}\" was deleted successfully."
            redirect_to topic

        else
            flash[:alert] = 'There was an error deleting the post.'
            redirect_to topic
        end
     end

    private

    def bookmark_params
        params.require(:bookmark).permit(:url)
    end
end
