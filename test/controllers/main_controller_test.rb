require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get main_login_url
    assert_response :success
  end

  test "should get create" do
    get main_create_url
    assert_response :success
  end

  test "should get destroy" do
    get main_destroy_url
    assert_response :success
  end

  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get profile" do
    get main_profile_url
    assert_response :success
  end

  test "should get market" do
    get main_market_url
    assert_response :success
  end

  test "should get phistory" do
    get main_phistory_url
    assert_response :success
  end

  test "should get shistory" do
    get main_shistory_url
    assert_response :success
  end

  test "should get inventory" do
    get main_inventory_url
    assert_response :success
  end

  test "should get topseller" do
    get main_topseller_url
    assert_response :success
  end
end
