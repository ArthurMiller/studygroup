require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:john).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a not found code on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "test correct variables on profile view" do
  	get :show, id: users(:john).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only shows the correct user statuses" do
  	get :show, id: users(:john).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:john), status.user
  	end
  end

end
