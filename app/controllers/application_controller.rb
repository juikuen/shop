# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	layout "store"
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected #----------------
	def authorize
		unless User.find_by_id(session[:user_id]) || User.count.zero?
			session[:original_uri] = request.request_uri
			flash[:notice] = "Please log in"
			redirect_to(:controller => 'admin', :action => 'login')
		end
		if (User.count.zero?)
			 if !(request.path_parameters[:controller] == 'users' and request.path_parameters[:action] == 'new')
				 if !(request.path_parameters[:controller] == 'users' and request.path_parameters[:action] == 'create')
        redirect_to(:controller => 'admin', :action => 'login')
				 end
			 end
	
		end
	end
end
