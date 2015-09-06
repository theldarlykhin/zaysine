require 'test_helper'

class ShippingInfosControllerTest < ActionController::TestCase
  setup do
    @shipping_info = shipping_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_info" do
    assert_difference('ShippingInfo.count') do
      post :create, shipping_info: { city: @shipping_info.city, contact_number: @shipping_info.contact_number, email: @shipping_info.email, full_name: @shipping_info.full_name, shipping_address: @shipping_info.shipping_address, township: @shipping_info.township }
    end

    assert_redirected_to shipping_info_path(assigns(:shipping_info))
  end

  test "should show shipping_info" do
    get :show, id: @shipping_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_info
    assert_response :success
  end

  test "should update shipping_info" do
    patch :update, id: @shipping_info, shipping_info: { city: @shipping_info.city, contact_number: @shipping_info.contact_number, email: @shipping_info.email, full_name: @shipping_info.full_name, shipping_address: @shipping_info.shipping_address, township: @shipping_info.township }
    assert_redirected_to shipping_info_path(assigns(:shipping_info))
  end

  test "should destroy shipping_info" do
    assert_difference('ShippingInfo.count', -1) do
      delete :destroy, id: @shipping_info
    end

    assert_redirected_to shipping_infos_path
  end
end
