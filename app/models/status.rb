 #  CS50 final project
 #  VirtualStudyApp
 #  Arthur Miller
 #  Computer Science 50 with Dr. David Malan
 #  Harvard University
 #  hosted at virtualstudyapp.com
 # 
 #  Social networking site for online collaboration.
class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  validates :content, 
  			presence: true,
  			length: { minimum: 2 }
  validates :user_id, 
  			presence: true
end
