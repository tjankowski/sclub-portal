# -*- encoding : utf-8 -*-
class RolesController < ApplicationController
  layout 'site'
  before_filter :check_administrator_role

  def index
    @user = User.find_by_login(params[:user_id])
    @all_roles = Role.find(:all)
  end

  def show
    @role = Role.find(params[:id])
  end

  def update
    @user = User.find_by_login(params[:login])
    @role = Role.find(params[:id])
    unless @user.has_role?(@role.rolename)
      @user.roles << @role
    end
    redirect_to :action => 'index'
  end

  def destroy
    @user = User.find_by_login(params[:user_id])
    @role = Role.find(params[:id])
    if @user.has_role?(@role.rolename)
      @user.roles.delete(@role)
    end
    redirect_to :action => 'index'
  end
end
