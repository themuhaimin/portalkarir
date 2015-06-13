require 'test_helper'

class PendidikansControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    @user2 = users(:pelamar)
    @user2.skip_confirmation!
    @user2.save!
    @pendidikan = pendidikans(:SMK)
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pendidikan" do
    assert_difference('Pendidikan.count') do
      post :create, pendidikan: { level_pend: 'SMA' }
    end

    assert_redirected_to pendidikan_path(assigns(:pendidikan))
  end

  test "should show pendidikan" do
    get :show, id: @pendidikan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pendidikan
    assert_response :success
  end

  test "should update pendidikan" do
    patch :update, id: @pendidikan, pendidikan: { level_pend: @pendidikan.level_pend }
    assert_redirected_to pendidikan_path(assigns(:pendidikan))
  end

  test "should destroy pendidikan" do
    assert_difference('Pendidikan.count', -1) do
      delete :destroy, id: @pendidikan
    end

    assert_redirected_to pendidikans_path
  end
  
  test "harus di redirect_to login jika belum login" do
    sign_out @user
    get :index
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
  
  test "harus di redirect_to beranda jika bukan admin" do
    sign_out @user
    sign_in @user2
    get :index
    assert_redirected_to root_url
  end
  
end
