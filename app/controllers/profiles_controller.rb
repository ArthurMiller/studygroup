 #  CS50 final project
 #  VirtualStudyApp
 #  Arthur Miller
 #  Computer Science 50 with Dr. David Malan
 #  Harvard University
 #  hosted at virtualstudyapp.com
 # 
 #  Social networking site for online collaboration.

class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		@statuses = @user.statuses.all
  		render actions: :show
  	else
  	render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
