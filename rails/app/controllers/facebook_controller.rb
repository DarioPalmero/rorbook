require 'facebook_publisher'
class FacebookController < ApplicationController
  ensure_application_is_installed_by_facebook_user

  def index
  	FacebookerPublisher.deliver_profile_for_user(current_user, active_record_user)
  end
  
  def invite_friends
  end
  
  def create_invitations
  end
   
  def help
  end
  
  def thanks
  	user = User.create(:facebook_id => current_user.id, :name => current_user.name)
  end
   
end
