class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @bookmarks = user.bookmarks
    # @user_bookmarks= User.bookmarks.find
    @liked_bookmarks = Bookmark.liked_by(user)
    # @liked_bookmarks = user.likes.map { |like| like.bookmark }
    #populate @user_bookmarks with the user's bookmarks
    # populate @liked_bookmarks with liked bookmarks
  end
end
