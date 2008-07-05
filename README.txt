---------------------------------
Setup
---------------------------------

YES I KNOW THE DOCUMENTATION IS CURRENTLY LACKING... I WILL FIX THAT SOON!

***
Facebook
***
This app is configured to run with the Facebook App "RoRBook". You should acess to it if you
are working on the project.


***
Database
***
sudo mysqladmin create rorbook_development
sudo mysqladmin create rorbook_test

***
Setup
***
rake db:migrate
Edit config/facebooker.yaml and set your information up.
Edit the facebook project to setup your environment.

***
Utilities
***
rake app:utilities:refresh_image
	image - this is the image(s) you want to update.  Accepts normal dir commands.  *.png (all png files), ra*.* (all files that start with ra)
	RAILS_ENV - environment to run on (reads in facebook settings from this environment)
rake app:utilities:refresh_all_images
	RAILS_ENV - environment to run on (reads in facebook settings from this environment)