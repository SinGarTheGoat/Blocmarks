class LikesController < ApplicationController
  def index
  end
  def create
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.build(bookmark: @bookmark)

   if like.save
       flash[:notice] = "Successfully liked bookmark."
   else
     flash.now[:alert] = 'Error in liking bookmark. Please try again.'
   end
     redirect_to topics_path#(params[:id])
 end

 def destroy
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.find(params[:id])
   # Get the bookmark from the params
   # Find the current user's like with the ID in the params

   if like.destroy
     flash[:notice] = "Successfully unliked bookmark."
   else
     flash.now[:alert] = 'Error in unliking bookmark. Please try again.'
   end
   redirect_to topics_path#(params[:id])
 end
end
