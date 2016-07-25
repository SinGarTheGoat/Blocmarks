class LikesController < ApplicationController
  def index
  end
  def create
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.build(bookmark: @bookmark)

<<<<<<< HEAD
   if like.save?
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
=======
   if like.save
       flash[:notice] = "Successfully liked bookmark."
   else
     flash.now[:alert] = 'Error in liking bookmark. Please try again.'
   end
     redirect_to topic_path(@bookmark.topic)
 end

 def destroy
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.find(params[:id])
   if like.destroy
     flash[:notice] = "Successfully unliked bookmark."
   else
     flash.now[:alert] = 'Error in unliking bookmark. Please try again.'
   end
   redirect_to topic_path(@bookmark.topic)
>>>>>>> master
 end
end
