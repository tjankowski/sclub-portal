# -*- encoding : utf-8 -*-
class FixturesController < ApplicationController
  layout "site"
  
  def index
    @club = Club.find_by_city("Kąty Wrocławskie");
    @teams = @club.teams
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    @seasons = Season.find_all_by_published(true)
  end

  def show
    @seasons = Season.find_all_by_published(true)
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    @season = Season.find(params[:id])
  end

end
