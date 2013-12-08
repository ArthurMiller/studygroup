require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:user_friendships)
	should have_many(:friends)

	test "a user should enter first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter last_name name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter profile_name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile_name" do
		user = User.new
		user.profile_name = users(:john).profile_name
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'johns', 
						last_name: 'dows', 
						email: 'arthurs.w.miller@gmail.com')
		user.password = user.password_confirmation = 'qwertyuiop'
		user.profile_name = "My profile_name with spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'johns', 
						last_name: 'dows', 
						email: 'arthurs.w.miller@gmail.com')
		user.password = user.password_confirmation = 'qwertyuiop'
		user.profile_name = "johnsdows"
		assert user.valid?
	end

	test "that no errors raised when trying to access friends list" do
		assert_nothing_raised do
			users(:john).friends
		end
	end

	test "that creating friendships on a user works" do
		users(:john).pending_friends << users(:mike)
		users(:john).pending_friends.reload
		assert users(:john).pending_friends.include?(users(:mike))
	end

	test "that calling to_program on a user returns the profile_name" do
		assert_equal "johndow", users(:john).to_param
	end
end
