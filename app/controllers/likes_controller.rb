class LikesController < ApplicationController
  def index
  end
  def create
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.build(bookmark: @bookmark)

   if like.save
     # Add code to generate a success flash and redirect to @bookmark
   else
     # Add code to generate a failure flash and redirect to @bookmark
   end
 end

 def destroy
   # Get the bookmark from the params
   # Find the current user's like with the ID in the params

   if like.destroy
     # Flash success and redirect to @bookmark
   else
     # Flash error and redirect to @bookmark
   end
 end
end
