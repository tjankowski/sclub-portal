# -*- encoding : utf-8 -*-
require 'test_helper'

class StaffTeamsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staff_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staff_team" do
    assert_difference('StaffTeam.count') do
      post :create, :staff_team => { }
    end

    assert_redirected_to staff_team_path(assigns(:staff_team))
  end

  test "should show staff_team" do
    get :show, :id => staff_teams(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => staff_teams(:one).to_param
    assert_response :success
  end

  test "should update staff_team" do
    put :update, :id => staff_teams(:one).to_param, :staff_team => { }
    assert_redirected_to staff_team_path(assigns(:staff_team))
  end

  test "should destroy staff_team" do
    assert_difference('StaffTeam.count', -1) do
      delete :destroy, :id => staff_teams(:one).to_param
    end

    assert_redirected_to staff_teams_path
  end
end
