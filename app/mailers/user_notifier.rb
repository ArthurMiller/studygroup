#  CS50 final project
 #  VirtualStudyApp
 #  Arthur Miller
 #  Computer Science 50 with Dr. David Malan
 #  Harvard University
 #  hosted at virtualstudyapp.com
 # 
 #  Social networking site for online collaboration.
class UserNotifier < ActionMailer::Base
  default from: "from@example.com"
  def friend_requested(user_friendship_id)
  	user_friendship = UserFriendship.find(user_friendship_id)
  	@user = user_friendship.user
  	@friend = user_friendship.friend
  	mail to: @friend.email,
  		subject: "#{@user.first_name} wants to form a study group on VirtualStudyApp.com"
  end
  def friend_request_accepted(user_friendship_id)
  	user_friendship = UserFriendship.find(user_friendship_id)
  	@user = user_friendship.user
  	@friend = user_friendship.friend
  	mail to: @user.email,
  		subject: "#{@friend.first_name} has accepted request on VirtualStudyApp.com"
  end
end
