require 'test_helper'

class ShippingRatesControllerTest < ActionController::TestCase
  setup do
    @shipping_rate = shipping_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_rate" do
    assert_difference('ShippingRate.count') do
      post :create, shipping_rate: { paid_all_by_customer: @shipping_rate.paid_all_by_customer, paid_all_by_merchant: @shipping_rate.paid_all_by_merchant, paid_by_merchant_if_purchase_amount_is: @shipping_rate.paid_by_merchant_if_purchase_amount_is, rate: @shipping_rate.rate }
    end

    assert_redirected_to shipping_rate_path(assigns(:shipping_rate))
  end

  test "should show shipping_rate" do
    get :show, id: @shipping_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_rate
    assert_response :success
  end

  test "should update shipping_rate" do
    patch :update, id: @shipping_rate, shipping_rate: { paid_all_by_customer: @shipping_rate.paid_all_by_customer, paid_all_by_merchant: @shipping_rate.paid_all_by_merchant, paid_by_merchant_if_purchase_amount_is: @shipping_rate.paid_by_merchant_if_purchase_amount_is, rate: @shipping_rate.rate }
    assert_redirected_to shipping_rate_path(assigns(:shipping_rate))
  end

  test "should destroy shipping_rate" do
    assert_difference('ShippingRate.count', -1) do
      delete :destroy, id: @shipping_rate
    end

    assert_redirected_to shipping_rates_path
  end
end
