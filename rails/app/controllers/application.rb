# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '778343f7953492021ddbb8cda10a34be'
  
  helper_method [:current_user, :friends, :active_record_user]
  
  def current_user
  	if session[:facebook_session]
  		session[:facebook_session].user
  	else
  		false
  	end
  end
  
  def friends
  	if session[:facebook_session]
  		User.find(:all, :conditions => {:facebook_user_id => session[:facebook_session].user.friends_with_this_app.map(&:id)})
  	else
  		false
  	end
  end
  
  def active_record_user
    if session[:facebook_session]
  		User.find(:first, :conditions => {:facebook_user_id => session[:facebook_session].user.id})
  	else
  		false
  	end
  end
  
end
