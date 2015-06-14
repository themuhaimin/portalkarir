require 'test_helper'

class PengumumannsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    @pengumumann = pengumumanns(:satu)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get show" do
    get :show, id: @pengumumann
    assert_response :success
  end
  
  test "should redirect to index if not admin try new" do
    get :new
    assert_redirected_to pengumumanns_url
  end
  
  test "should redirect to index if not admin try edit" do
    get :edit, id: @pengumumann
    assert_redirected_to pengumumanns_url
  end
  
end
