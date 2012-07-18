# -*- encoding : utf-8 -*-
require 'test_helper'

class GalleryContentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gallery_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery_content" do
    assert_difference('GalleryContent.count') do
      post :create, :gallery_content => { }
    end

    assert_redirected_to gallery_content_path(assigns(:gallery_content))
  end

  test "should show gallery_content" do
    get :show, :id => gallery_contents(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => gallery_contents(:one).to_param
    assert_response :success
  end

  test "should update gallery_content" do
    put :update, :id => gallery_contents(:one).to_param, :gallery_content => { }
    assert_redirected_to gallery_content_path(assigns(:gallery_content))
  end

  test "should destroy gallery_content" do
    assert_difference('GalleryContent.count', -1) do
      delete :destroy, :id => gallery_contents(:one).to_param
    end

    assert_redirected_to gallery_contents_path
  end
end
