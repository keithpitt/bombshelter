class PagesController < ApplicationController

   layout 'interior'
   before_filter :login_required, :only => :resources
   
   def index
      render :layout => 'home'
   end
   
   def login
      if request.post?
         if params[:user][:email] == "bombshelter" and params[:user][:password] == "magic"
            logged_in
            redirect_to :action => :resources
         else
            @error = "Invalid username or password."
         end
      end
   end
   
   def resources
      
   end

end
