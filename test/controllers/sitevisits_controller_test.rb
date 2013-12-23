require 'test_helper'

class SitevisitsControllerTest < ActionController::TestCase
  setup do
    @sitevisit = sitevisits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sitevisits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sitevisit" do
    assert_difference('Sitevisit.count') do
      post :create, sitevisit: { ip: @sitevisit.ip, ua: @sitevisit.ua }
    end

    assert_redirected_to sitevisit_path(assigns(:sitevisit))
  end

  test "should show sitevisit" do
    get :show, id: @sitevisit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sitevisit
    assert_response :success
  end

  test "should update sitevisit" do
    patch :update, id: @sitevisit, sitevisit: { ip: @sitevisit.ip, ua: @sitevisit.ua }
    assert_redirected_to sitevisit_path(assigns(:sitevisit))
  end

  test "should destroy sitevisit" do
    assert_difference('Sitevisit.count', -1) do
      delete :destroy, id: @sitevisit
    end

    assert_redirected_to sitevisits_path
  end
end
