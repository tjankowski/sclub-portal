# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController
  layout "site", :except => :auto_complete
  before_filter :check_administrator_role, :except => :show
  
  def new
    @title = "Motobi Kąty Wrocławskie - Kluby"
    if param_posted?(:club)
      @club = Club.new(params[:club])
      if @club.save
        flash[:notice] = "Dodano klub"
        redirect_to :controller => "clubs", :action => "index"
      end
    end
  end

  def index
    @title = "Motobi Kąty Wrocławskie - Kluby"
    @clubs = Club.find(:all)
  end

  def edit
    @title = "Motobi Kąty Wrocławskie - Kluby"
    @club = Club.find_by_id(params[:id])
    if param_posted?(:club)
      if @club.update_attributes!(params[:club])
        flash[:notice] = "Zmieniono dane klubu"
        redirect_to :controller => "clubs", :action => "index"
      else
        flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "clubs", :action => "index"
      end
    end
  end

  def delete
    @title = "Motobi Kąty Wrocławskie - Kluby"
    @club = Club.find_by_id(params[:id])
    if @club.delete
      flash[:notice] = "Skasowano dane klubu"
      redirect_to :controller => "clubs", :action => "index"
    else
      flash[:notice] = "Nie dokonano zmian"
      redirect_to :controller => "clubs", :action => "index"
    end
  end

  def show
    @title = "Motobi Kąty Wrocławskie - Kluby"
    @club = Club.find_by_id(params[:id])
  end

  def auto_complete
    @clubs = Club.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:search].downcase}%"])
  end

end
