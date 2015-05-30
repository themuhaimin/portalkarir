require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  def setup
    @base_title = "CARfix Karir"
  end

  test "should get beranda" do
    get :beranda
    assert_response :success
    assert_select "title", "Beranda | #{@base_title}"
  end

  test "should get tentang" do
    get :tentang
    assert_response :success
    assert_select "title", "Tentang CARfix | #{@base_title}"
  end

end
