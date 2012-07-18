# -*- encoding : utf-8 -*-
require 'test_helper'

class ShoutboxesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoutboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoutbox" do
    assert_difference('Shoutbox.count') do
      post :create, :shoutbox => { }
    end

    assert_redirected_to shoutbox_path(assigns(:shoutbox))
  end

  test "should show shoutbox" do
    get :show, :id => shoutboxes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shoutboxes(:one).to_param
    assert_response :success
  end

  test "should update shoutbox" do
    put :update, :id => shoutboxes(:one).to_param, :shoutbox => { }
    assert_redirected_to shoutbox_path(assigns(:shoutbox))
  end

  test "should destroy shoutbox" do
    assert_difference('Shoutbox.count', -1) do
      delete :destroy, :id => shoutboxes(:one).to_param
    end

    assert_redirected_to shoutboxes_path
  end
end
