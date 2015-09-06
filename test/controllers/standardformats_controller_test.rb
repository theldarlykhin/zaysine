require 'test_helper'

class StandardformatsControllerTest < ActionController::TestCase
  setup do
    @standardformat = standardformats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standardformats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standardformat" do
    assert_difference('Standardformat.count') do
      post :create, standardformat: { currency: @standardformat.currency, defaultweightunit: @standardformat.defaultweightunit, timezone: @standardformat.timezone, unitsystemstring: @standardformat.unitsystemstring }
    end

    assert_redirected_to standardformat_path(assigns(:standardformat))
  end

  test "should show standardformat" do
    get :show, id: @standardformat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standardformat
    assert_response :success
  end

  test "should update standardformat" do
    patch :update, id: @standardformat, standardformat: { currency: @standardformat.currency, defaultweightunit: @standardformat.defaultweightunit, timezone: @standardformat.timezone, unitsystemstring: @standardformat.unitsystemstring }
    assert_redirected_to standardformat_path(assigns(:standardformat))
  end

  test "should destroy standardformat" do
    assert_difference('Standardformat.count', -1) do
      delete :destroy, id: @standardformat
    end

    assert_redirected_to standardformats_path
  end
end
