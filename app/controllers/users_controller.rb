class UsersController < ApplicationController
  def show
    @user_bookmarks= User.likes.find(params[:user_id])

    # populate @user_bookmarks with the user's bookmarks
    # populate @liked_bookmarks with liked bookmarks
  end
end
