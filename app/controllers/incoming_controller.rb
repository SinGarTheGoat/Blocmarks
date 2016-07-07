class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
 skip_before_action :verify_authenticity_token, :authenticate_user!, only: [:create]

 def create
  #binding.pry
   @user = User.find_by(email: params[:sender])
   @topic = @user.topics.find_or_create_by(title: params[:Subject])
   @bookmark = @topic.bookmarks.build( url: params["body-plain"])
   @bookmark.save
   # Step 1: Look up User based on sender.
   # Step 2: Look up Topic based on subject.
   # Step 3: Create bookmark that's associated with Topic and User based on body.
   puts @user
   puts @topic
   puts @bookmark
   ap @user
   ap @topic
   ap @bookmark
   head 200
 end

end
