require 'test_helper'

class LamaransControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    sign_in @user
  end

  test "should get index if admin" do
    get :index
    assert_response :success
  end
  
end
