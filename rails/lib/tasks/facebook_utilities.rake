require 'yaml'
require 'facebooker'
namespace :app do
  
  namespace :server_cache do
  	
  	def generate_session
  		api_key = YAML.load(File.read(File.join(RAILS_ROOT, "config", "facebooker.yml")))[RAILS_ENV]["api_key"]
  		secret_key = YAML.load(File.read(File.join(RAILS_ROOT, "config", "facebooker.yml")))[RAILS_ENV]["secret_key"]
  		Facebooker::Session.new(api_key, secret_key) 
  	end
    
    task :refresh_all_images => :environment do
    	session = generate_session
    	images = Dir.glob(File.join(RAILS_ROOT,"public","images", "**", "*.{png,jpg,jpeg,gif}"))
    	images.each do |img|
        Facebooker::Rails::Utilities.refresh_image(session,img)
      end
    end
    
    task :refresh_image => :environment do
    	session = generate_session
    	images = Dir.glob(File.join(RAILS_ROOT,"public","images", "**", ENV["image"]))
    	images.each do |image|
    		Facebooker::Rails::Utilities.refresh_image(session,image)
    	end
    end
    
  end
  
end