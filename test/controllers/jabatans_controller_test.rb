require 'test_helper'

class JabatansControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    @user2 = users(:pelamar)
    @user2.skip_confirmation!
    @user2.save!
    @jabatan = jabatans(:mekanik)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jabatans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jabatan" do
    assert_difference('Jabatan.count') do
      post :create, jabatan: { nama_jabatan: 'Direktur' }
    end
    assert_redirected_to jabatan_path(assigns(:jabatan))
  end

  test "should show jabatan" do
    get :show, id: @jabatan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jabatan
    assert_response :success
  end

  test "should update jabatan" do
    patch :update, id: @jabatan, jabatan: { nama_jabatan: @jabatan.nama_jabatan }
    assert_redirected_to jabatan_path(assigns(:jabatan))
  end

  test "should destroy jabatan" do
    assert_difference('Jabatan.count', -1) do
      delete :destroy, id: @jabatan
    end
    assert_redirected_to jabatans_path
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
