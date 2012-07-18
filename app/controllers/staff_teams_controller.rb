# -*- encoding : utf-8 -*-
class StaffTeamsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def index
    @staff = Staff.find(params[:id])
    @all_teams = Team.find(:all)
  end

  def add
    @staff = Staff.find(params[:staff_id])
    @team = Team.find(params[:id])
    unless @staff.has_team?(@team)
      @staff.teams << @team
    end
    redirect_to :action => 'index', :id => @staff
  end

  def remove
    @staff = Staff.find(params[:staff_id])
    @team = Team.find(params[:id])
    if @staff.has_team?(@team)
      @staff.galleries.delete(@team)
    end
    redirect_to :action => 'index', :id => @staff
  end
  
end
