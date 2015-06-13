require 'test_helper'

class ProfilsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @user = users(:admin)
    @user.skip_confirmation!
    @user.save!
    @user2 = users(:pelamar)
    @user2.skip_confirmation!
    @user2.save!
    sign_in @user
  end
  
  test "should get new" do
    get :new, :user_id => @user.id
    assert_response :success
  end
  
  test "should create profil" do
    assert_difference('Profil.count') do
      post :create, :user_id => @user.id ,
      profil: {
          nama_lengkap: 'Admin',
          no_identitas: '111111111',
          jenis_kelamin: true,
          alamat: 'Jl. aaaaaa',
          tempat_lahir: 'Jakarta',
          tgl_lahir: '2000-01-01',
          no_hp: '085555555',
          pendidikan_id: pendidikans(:SMK),
          nama_pend: 'aaaaaaa',
          jurusan: 'aaaaaa',
          nilai: 8.8
      }
    end
    assert_not flash.empty?
    assert_response :success
  end
  
  test "should get show" do
    get :show, :user_id => @user.id
    assert_response :success
  end
  
  test "should get show other profil if admin" do
    get :show, :user_id => @user2.id
    assert_response :success
  end
  
  test "should redirect_to beranda if not admin_or_correct_user" do
    sign_out @user
    sign_in @user2
    get :show, :user_id => @user.id
    assert_response :success
  end
end
