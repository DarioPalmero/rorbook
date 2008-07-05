require 'facebooker'
class FacebookerPublisher < Facebooker::Rails::Publisher

  def mini_feed(user)
    send_as :action
    self.from(user)
    title "Added new services!"
    body render(:partial => "facebook/minifeed")
    RAILS_DEFAULT_LOGGER.debug("Sending mini feed story for user #{user.name}")
  end
  
	def profile_for_user(current_user, active_record_user)
		return if active_record_user.blank?
    send_as :profile
    from current_user
    recipients current_user
    fbml = render(:partial =>"/facebook/user_profile", :locals => {:user => active_record_user})
    profile(fbml)
    action =  render(:partial => "facebook/profile_action", :locals => {:user => current_user}) 
    profile_action(action) 
	end

	def news_feed(recipients, title, body)
	  send_as :story
	  self.recipients(Array(recipients))
	  title = title[0..60] if title.length > 60
	  body = body[0..200] if body.length > 200
	  self.body( body )
	  self.title( title )
  	#image_1(image_path("fbtt.png"))
  	#image_1_link(outline_path(:only_path => false))
	end


end