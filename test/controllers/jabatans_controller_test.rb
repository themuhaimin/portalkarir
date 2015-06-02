require 'test_helper'

class JabatansControllerTest < ActionController::TestCase
  setup do
    @jabatan = jabatans(:one)
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
      post :create, jabatan: { nama_jabatan: @jabatan.nama_jabatan }
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
end
