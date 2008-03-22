module FacebookHelper
  
  def show_session_data
           facebooker_session = @current_facebook_session.clone
           facebooker_session.instance_variable_set("@secret_key",'xxxxxxxxxxxxxxxxxxx')
           facebooker_session.to_yaml
  end 
  
  
end
