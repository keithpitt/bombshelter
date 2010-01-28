# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'aa4f1dcf3df509f498af991b9a1cd3a5'
  
  def login_required
    if !session[:logged_in]
      redirect_to login_path
    end
  end
  
  def logged_in
    session[:logged_in] = true
  end
   
end
