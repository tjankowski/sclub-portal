# -*- encoding : utf-8 -*-
require 'test_helper'

class MainPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_photo" do
    assert_difference('MainPhoto.count') do
      post :create, :main_photo => { }
    end

    assert_redirected_to main_photo_path(assigns(:main_photo))
  end

  test "should show main_photo" do
    get :show, :id => main_photos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => main_photos(:one).to_param
    assert_response :success
  end

  test "should update main_photo" do
    put :update, :id => main_photos(:one).to_param, :main_photo => { }
    assert_redirected_to main_photo_path(assigns(:main_photo))
  end

  test "should destroy main_photo" do
    assert_difference('MainPhoto.count', -1) do
      delete :destroy, :id => main_photos(:one).to_param
    end

    assert_redirected_to main_photos_path
  end
end
