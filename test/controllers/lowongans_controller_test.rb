require 'test_helper'

class LowongansControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    @lowongan = lowongans(:satu)
  end

  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get show" do
    get :show, id: @lowongan
    assert_response :success
  end
  
  test "should redirect to index if not admin try new" do
    get :new
    assert_redirected_to lowongans_url
  end
  
  test "should redirect to index if not admin try edit" do
    get :edit, id: @lowongan
    assert_redirected_to lowongans_url
  end
  
end
