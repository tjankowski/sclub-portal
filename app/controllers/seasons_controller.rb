# -*- encoding : utf-8 -*-
class SeasonsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :except => :show

  def index
    @title = "Motobi Kąty Wrocławskie"
    @seasons = Season.find :all
  end

  def new
    @title = "Motobi Kąty Wrocławskie"
    if param_posted?(:season)
      @season = Season.new(params[:season])
      if @season.save
        flash[:notice] = "Dodano nowy sezon"
        redirect_to :controller => "seasons", :action => "index"
      else
        flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "seasons", :action => "index"
      end
    end
  end

  def edit
    @title = "Motobi Kąty Wrocławskie"
    @season = Season.find(params[:id])
    if param_posted?(:season)
      if @season.update_attributes(params[:season])
        flash[:notice] = "Zmieniono dane sezonu"
        redirect_to :controller => "seasons", :action => "show", :id => @season
      else
        flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "seasons", :action => "show", :id => @season
      end
    end
  end

  def delete
    @title = "Motobi Kąty Wrocławskie"
    @season = Season.find(params[:id])
    if @season.delete
      flash[:notice] = "Usunięto sezon"
      redirect_to :controller => "seasons", :action => "index"
    else
      flash[:notice] = "Nie dokonano zmian"
      redirect_to :controller => "seasons", :action => "index"
    end
  end

  def show
    @title = "Motobi Kąty Wrocławskie"
    @season = Season.find(params[:id])
    @season.proccess_season_standings
  end

end
