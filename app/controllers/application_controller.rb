class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :authenticate_user!
    include Pundit
    protect_from_forgery with: :exception

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = 'You are not authorized to peform that action'
        redirect_to(request.referrer || root_path)
    end
end
