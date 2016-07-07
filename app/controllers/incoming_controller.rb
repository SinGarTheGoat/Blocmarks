class IncomingController < ApplicationController
skip_before_action :verify_authenticity_token, :authenticate_user!, only: [:create]

 def create
   @user = User.find_by(email: params[:sender])
   @topic = @user.topics.find_or_create_by(title: params[:Subject])
   @bookmark = @topic.bookmarks.build( url: params["body-plain"], user: @user)
   @bookmark.save
   head 200
 end

end
