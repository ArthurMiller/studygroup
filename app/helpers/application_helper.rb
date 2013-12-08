 #  CS50 final project
 #  VirtualStudyApp
 #  Arthur Miller
 #  Computer Science 50 with Dr. David Malan
 #  Harvard University
 #  hosted at virtualstudyapp.com
 # 
 #  Social networking site for online collaboration.
 
module ApplicationHelper
	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else ""
		end
	end	
end
