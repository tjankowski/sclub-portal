# -*- encoding : utf-8 -*-
class ClubController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :only => [:edit_information]
  
  def history
    @title = "Motobi Kąty Wrocławskie - Historia"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    @article = Article.new :title => "Historia", :body => @info.history, :published => "true", :updated_at => @info.updated_at, :created_at => @info.created_at
  end

  def contact
    @title = "Motobi Kąty Wrocławskie - Kontakt"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    @article = Article.new :title => "Kontakt", :body => @info.contact, :published => "true", :updated_at => @info.updated_at, :created_at => @info.created_at
  end

  def trophies
    @title = "Motobi Kąty Wrocławskie - Trofea"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    @article = Article.new :title => "Trofea", :body => @info.trophies, :published => "true", :updated_at => @info.updated_at, :created_at => @info.created_at
  end

  def sponsors
    @title = "Motobi Kąty Wrocławskie - Sponsorzy"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    @article = Article.new :title => "Sponsoring", :body => @info.sponsors, :published => "true", :updated_at => @info.updated_at, :created_at => @info.created_at
  end

  def officials
    @title = "Motobi Kąty Wrocławskie - Władze"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    @article = Article.new :title => "Zarząd", :body => @info.officials, :published => "true", :updated_at => @info.updated_at, :created_at => @info.created_at
  end

  def edit_information
    @title = "Motobi Kąty Wrocławskie - Informacje o klubie"
    @info = ClubInformation.last
    if @info.nil?
      @info = ClubInformation.create
    end
    if param_posted?(:info)
      if @info.update_attributes(params[:info])
        flash[:notice] = "Informacje uaktualnione"
        redirect_to :controller => "club", :action => "index"
      end
    end
  end

end
