# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'basic'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def index
    if session[:user_id]
      user = User.find_by_id(session[:user_id])
      @name = user.name
      @email = user.email
    end
  end
  
private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section" 
      redirect_to root_url
    end
  end

  def logged_in?
    if Rails.env.test?
      session[:user_id] = User.find_by_name("User A")
      return true
      #session[:user_id] = 1
      #return true
    end
    session[:user_id] != nil
  end

end
