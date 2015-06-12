require 'test_helper'

class PendidikansControllerTest < ActionController::TestCase
  setup do
    @pendidikan = pendidikans(:S1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pendidikans)
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
end
