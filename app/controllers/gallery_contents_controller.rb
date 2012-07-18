# -*- encoding : utf-8 -*-
class GalleryContentsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def index
    @photo = Photo.find(params[:id])
    @all_galleries = Gallery.find(:all)
  end

  def add
    @photo = Photo.find(params[:photo_id])
    @gallery = Gallery.find(params[:id])
    unless @gallery.has_photo?(@photo)
      @gallery.photos << @photo
    end
    redirect_to :action => 'index', :id => @photo
  end

  def remove
    @photo = Photo.find(params[:photo_id])
    @gallery = Gallery.find(params[:id])
    if @gallery.has_photo?(@photo)
      @gallery.photos.delete(@photo)
    end
    redirect_to :action => 'index', :id => @photo
  end
  
end
