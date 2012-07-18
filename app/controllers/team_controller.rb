# -*- encoding : utf-8 -*-
class TeamController < ApplicationController
  layout "site"
  
  def players
    @team = Team.find(params[:id])
    @goalkeapers = @team.players.find(:all, :conditions => ['position = :q AND season_id = :season', { :q =>"Bramkarz", :season => @team.last_season}])
    @defenders = @team.players.find(:all, :conditions => ['position LIKE :q AND season_id = :season', { :q => "%Obro%", :season => @team.last_season}])
    @midfilders = @team.players.find(:all, :conditions => ['position LIKE :q AND season_id = :season', { :q => "%Pomoc%", :season => @team.last_season}])
    @forwards = @team.players.find(:all, :conditions => ['position LIKE :q AND season_id = :season', { :q => "%Napa%", :season => @team.last_season}])
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
  end

  def staff
    @team = Team.find(params[:id])
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
  end

  def news
    @team = Team.find(params[:id])
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    @articles = []
    for article in (Article.find_all_by_published true, :order => "created_at DESC")
      if article.has_tag?(@team.name)
        @articles << article
      end
    end
    @articles = @articles.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # news.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def index
    @title = "Motobi Kąty Wrocławskie"
  end

  def show
    @team = Team.find(params[:id])
    @title = "Motobi Bystrzyca Kąty Wrocławskie - "+@team.name
  end

end
