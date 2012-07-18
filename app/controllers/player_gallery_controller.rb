# -*- encoding : utf-8 -*-
class PlayerGalleryController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def index
    @player = Player.find(params[:id])
    @all_galleries = Gallery.find(:all)
  end

  def add
    @player = Player.find(params[:player_id])
    @gallery = Gallery.find(params[:id])
    unless @player.has_gallery?(@gallery)
      @player.galleries << @gallery
    end
    redirect_to :action => 'index', :id => @player
  end

  def remove
    @player = Player.find(params[:player_id])
    @gallery = Gallery.find(params[:id])
    if @player.has_gallery?(@gallery)
      @player.galleries.delete(@gallery)
    end
    redirect_to :action => 'index', :id => @player
  end

end
