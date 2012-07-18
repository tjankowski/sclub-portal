# -*- encoding : utf-8 -*-
require 'test_helper'

class LiveBroadcastsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:live_broadcasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create live_broadcast" do
    assert_difference('LiveBroadcast.count') do
      post :create, :live_broadcast => { }
    end

    assert_redirected_to live_broadcast_path(assigns(:live_broadcast))
  end

  test "should show live_broadcast" do
    get :show, :id => live_broadcasts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => live_broadcasts(:one).to_param
    assert_response :success
  end

  test "should update live_broadcast" do
    put :update, :id => live_broadcasts(:one).to_param, :live_broadcast => { }
    assert_redirected_to live_broadcast_path(assigns(:live_broadcast))
  end

  test "should destroy live_broadcast" do
    assert_difference('LiveBroadcast.count', -1) do
      delete :destroy, :id => live_broadcasts(:one).to_param
    end

    assert_redirected_to live_broadcasts_path
  end
end
