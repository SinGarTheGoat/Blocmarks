class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @bookmarks = user.bookmarks
    @liked_bookmarks = Bookmark.liked_by(user)
  end
end
