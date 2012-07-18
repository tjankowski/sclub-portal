# -*- encoding : utf-8 -*-
class TagsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role
  
  def index
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    @tags = Tag.find :all
  end

  def new
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    if param_posted?(:tag)
      @tag = Tag.new(params[:tag])
      if @tag.save
        flash[:notice] = "Dodano nowy tag"
        redirect_to :controller => "tags", :action => "index"
    else
      flash[:notice] = "Nie dokonano zmian"
        redirect_to :controller => "tags", :action => "index"
      end
    end
  end

  def delete
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    @tag = Tag.find_by_id(params[:id])
    if @tag.delete
      flash[:notice] = "Skasowano tag"
      redirect_to :controller => "tags", :action => "index"
    else
      flash[:notice] = "Nie dokonano zmian"
      redirect_to :controller => "tags", :action => "index"
    end
  end

end
