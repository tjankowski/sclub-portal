# -*- encoding : utf-8 -*-
class TeamsController < ApplicationController
  layout "site", :except => :auto_complete
  before_filter :check_administrator_role, :except => :show

  def new
    @title = "Motobi Kąty Wrocławskie"
    if param_posted?(:team)
      @team = Team.new(params[:team])
      if @team.save
        flash[:notice] = "Dodano nowy zespoł"
        redirect_to :controller => "teams", :action => "index"
      else
        flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "teams", :action => "index"
      end
    end
  end

  def index
    @title = "Motobi Kąty Wrocławskie"
    @teams = Team.find :all
  end

  def edit
    @title = "Motobi Kąty Wrocławskie"
    @tean = Team.find_by_id(params[:id])
    if param_posted?(:team)
      if @team.update_attributes(params[:id])
        flash[:notice] = "Zmieniono nazwę"
        redirect_to :controller => "teams", :action => "index"
      else
        flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "teams", :action => "index"
      end
    end
  end

  def delete
    @title = "Motobi Kąty Wrocławskie"
    @team = Team.find_by_id(params[:id])
    if @team.delete
      flash[:notice] = "Skasowano dane klubu"
      redirect_to :controller => "teams", :action => "index"
    else
      flash[:notice] = "Nie dokonano zmian"
      redirect_to :controller => "teams", :action => "index"
    end
  end

  def auto_complete
    @teams = Team.find(:all, :conditions => ['lower(official_name) LIKE ?', "%#{params[:search].downcase}%"])
  end

end
