require 'test_helper'

class MerchantInfosControllerTest < ActionController::TestCase
  setup do
    @merchant_info = merchant_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_info" do
    assert_difference('MerchantInfo.count') do
      post :create, merchant_info: { account_email: @merchant_info.account_email, city: @merchant_info.city, customer_email: @merchant_info.customer_email, name: @merchant_info.name, phone: @merchant_info.phone, postal: @merchant_info.postal, storename: @merchant_info.storename, street: @merchant_info.street }
    end

    assert_redirected_to merchant_info_path(assigns(:merchant_info))
  end

  test "should show merchant_info" do
    get :show, id: @merchant_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_info
    assert_response :success
  end

  test "should update merchant_info" do
    patch :update, id: @merchant_info, merchant_info: { account_email: @merchant_info.account_email, city: @merchant_info.city, customer_email: @merchant_info.customer_email, name: @merchant_info.name, phone: @merchant_info.phone, postal: @merchant_info.postal, storename: @merchant_info.storename, street: @merchant_info.street }
    assert_redirected_to merchant_info_path(assigns(:merchant_info))
  end

  test "should destroy merchant_info" do
    assert_difference('MerchantInfo.count', -1) do
      delete :destroy, id: @merchant_info
    end

    assert_redirected_to merchant_infos_path
  end
end
