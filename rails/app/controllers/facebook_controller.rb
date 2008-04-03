class FacebookController < ApplicationController
  ensure_authenticated_to_facebook
  ensure_application_is_installed_by_facebook_user [:only => "index"]

  def index
    @userF = session[:facebook_session].user
  end
  
  def invite_friends
  end
  
  def create_invitations
  end
   
  def help
  end
   
end
