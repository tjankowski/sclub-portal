# -*- encoding : utf-8 -*-
require 'test_helper'

class BroadcastMessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:broadcast_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create broadcast_message" do
    assert_difference('BroadcastMessage.count') do
      post :create, :broadcast_message => { }
    end

    assert_redirected_to broadcast_message_path(assigns(:broadcast_message))
  end

  test "should show broadcast_message" do
    get :show, :id => broadcast_messages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => broadcast_messages(:one).to_param
    assert_response :success
  end

  test "should update broadcast_message" do
    put :update, :id => broadcast_messages(:one).to_param, :broadcast_message => { }
    assert_redirected_to broadcast_message_path(assigns(:broadcast_message))
  end

  test "should destroy broadcast_message" do
    assert_difference('BroadcastMessage.count', -1) do
      delete :destroy, :id => broadcast_messages(:one).to_param
    end

    assert_redirected_to broadcast_messages_path
  end
end
