 #  CS50 final project
 #  VirtualStudyApp
 #  Arthur Miller
 #  Computer Science 50 with Dr. David Malan
 #  Harvard University
 #  hosted at virtualstudyapp.com
 # 
 #  Social networking site for online collaboration.
 
class UserFriendshipDecorator < Draper::Decorator
  delegate_all

  def friendship_state
  	"pending"
  end
end
